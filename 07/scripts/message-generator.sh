for i in $(seq 1 100);
do
    sleep 5
    echo "Sending message $i" | nc localhost 1514
done