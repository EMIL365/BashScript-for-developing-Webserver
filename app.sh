#!/bin/bash


while true ;
do
         nc -l -k -p 8082  -c 'echo -e "HTTP/1.1 200 OK\n\n $(./http_socket.sh)"';
done
