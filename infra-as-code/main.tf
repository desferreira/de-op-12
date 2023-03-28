terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "ada"
  region  = "us-east-1"
}

# 1. Create vpc
resource "aws_vpc" "dev-vpc" {
  cidr_block = "172.16.1.0/25"
  tags = {
    Name = "dev"
  }
}

# 2. Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.dev-vpc.id
}

# # 3. Create Custom Route Table
resource "aws_route_table" "dev-route-table" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Dev"
  }
}

# 4. Create a Public Subnet
resource "aws_subnet" "public-subnet" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.subnets_availability_zones[count.index]

  tags = {
    Name = "public-${count.index}"
  }
}


# 5. Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.dev-route-table.id
}


# 7. Create a network interface with an ip in the subnet that was created in step 4
resource "aws_network_interface" "web-server-nic" {
  count           = length(var.public_subnets)
  subnet_id       = aws_subnet.public-subnet[count.index].id
  security_groups = [aws_security_group.allow_web.id]
}

# 8. Assign an elastic IP to the network interface created in step 7
resource "aws_eip" "one" {
  vpc               = true
  network_interface = aws_network_interface.web-server-nic[0].id
  depends_on        = [aws_internet_gateway.gw, aws_instance.web-server-instance]
}


resource "aws_subnet" "private-subnet" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.subnets_availability_zones[count.index]

  tags = {
    Name = "private-${count.index}"
  }
}

# 6. Create Security Group to allow port 22,80,443, 8080, 3000, 9000
resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.dev-vpc.id


  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "java"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "graylog"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "nodexporter"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "prometheus"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "alertmanager"
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "grafana"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "Download from Internet"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web"
  }
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "deployer-key"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

# 9. Create Centos server
resource "aws_instance" "web-server-instance" {
  ami               = "ami-016eb5d644c333ccb" # Centos
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  key_name          = "test"
    root_block_device {
    volume_size = 60
    volume_type = "gp2"
  }

  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.web-server-nic[0].id
  }

  user_data = file("scripts/startup.sh")


  tags = {
    Name = "DE-OP-012-Observability"
  }
}
output "server_public_ip" {
  value = aws_eip.one.public_ip
}
