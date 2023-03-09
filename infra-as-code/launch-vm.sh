# # Deploying infrastructure
cd infra-as-code
terraform apply -auto-approve
VM_PUBLIC_IP=$(terraform output -raw server_public_ip)

cd ..
scp -i ~/.ssh/test.pem -r $(pwd) ec2-user@$VM_PUBLIC_IP:/home/ec2-user
