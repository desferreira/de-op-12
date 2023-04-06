a=0
until [ ! $a -lt 500 ]
do
    curl localhost:8080/hello
    sleep 4
     a=`expr $a + 1`
done
