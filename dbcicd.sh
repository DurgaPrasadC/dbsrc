#!/bin/bash
export /usr/bin/psql

rm -rf /home/ec2-user/rdscicd/deployment-script/db_creation_error_log.log
rm -rf /home/ec2-user/rdscicd/deployment-script/table_creation_error_log.log
rm -rf /home/ec2-user/rdscicd/deployment-script/object_creation_error_log.log

cd deployment-script

echo "Invoking db creation script"
python database_creation.py
sleep 5

echo "Invoking table creation script"
python table_creation.py
sleep 5

echo "Invoking object creation script"
python object_creation.py
sleep 5
