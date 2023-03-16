a=0
until [ ! $a -lt 150 ]
do
    curl localhost:8080/hello
    sleep 1
     a=`expr $a + 1`
done