#!/bin/bash
export /usr/bin/psql

python /home/ec2-user/rdscicd/deployment-script/database_creation.py
sleep 5s

python /home/ec2-user/rdscicd/deployment-script/table_creation.py
sleep 5s

python /home/ec2-user/rdscicd/deployment-script/object_creation.py
sleep 5s

