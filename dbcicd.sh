#!/bin/bash
export /usr/bin/psql

rm -rf /home/ec2-user/rdscicd/deployment-script/db_creation_error_log.log
rm -rf /home/ec2-user/rdscicd/deployment-script/table_creation_error_log.log
rm -rf /home/ec2-user/rdscicd/deployment-script/object_creation_error_log.log

cd /home/ec2-user/rdscicd/deployment-script

echo "Invoking db creation script."
python database_creation.py
sleep 5
errCount=$(tr -s ' ' '\n' < db_creation_error_log.log | grep ERROR | wc -l)
if [ $errCount -gt 0 ]
then
   echo "Error occurred while creating database and schema."
   cat db_creation_error_log.log
   exit -1
fi

echo "Invoking table creation script"
python table_creation.py
sleep 5
errCount=$(tr -s ' ' '\n' < table_creation_error_log.log | grep ERROR | wc -l)
if [ $errCount -gt 0 ]
then
   echo "Error occurred while creating tables."
   cat table_creation_error_log.log
   exit -1
fi

echo "Invoking object creation script."
python object_creation.py
sleep 5
errCount=$(tr -s ' ' '\n' < object_creation_error_log.log | grep ERROR | wc -l)
if [ $errCount -gt 0 ]
then
    echo "Error occurred while creating objects."
    cat object_creation_error_log.log
    exit -1
fi