#!/bin/bash

read request_header


echo $request_header > URL_RAW.http

url_serlet=`grep 'GET ' URL_RAW.http  | cut -d " " -f2`




if [ $url_serlet == "/currentDisk" ]
then
	actual_value_space=`df -h  /dev/xvda1  | awk 'FNR==2{print $5}'  |tr -d '%'`
	echo "{
	         
                "statusCode": "SC0000",
                "statusDesc": "Success",
                "respTime": "15-12-2021 11:08:02",
                "responseData": {
                "diskSpace": "$actual_value_space%" 
    }
}"

elif [  $url_serlet == "/globalRst" ]
then
	#Restart_script
	echo "{
	       "statusCode": "SC0000",
                "statusDesc": "Success",
                "respTime": "15-12-2021 11:08:02",
                "responseData": {
                "diskSpace": "Restarted"
    }
}"
fi
