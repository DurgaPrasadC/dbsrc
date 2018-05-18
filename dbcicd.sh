#!/bin/bash
export /usr/bin/psql

echo "Invoking db creation script"
python /home/ec2-user/rdscicd/deployment-script/database_creation.py
sleep 5s

echo "Invoking table creation script"
python /home/ec2-user/rdscicd/deployment-script/table_creation.py
sleep 5s

echo "Invoking object creation script"
python /home/ec2-user/rdscicd/deployment-script/object_creation.py
sleep 5s

