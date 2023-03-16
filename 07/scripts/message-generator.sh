a=0
until [ ! $a -lt 150 ]
do
    echo "Sending message $a"
    echo "{\"message\": \"$a\"}" | nc localhost 1514
    sleep 1
     a=`expr $a + 1`
done