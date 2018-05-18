#!/bin/bash

cd /home/ec2-user/rdscicd
echo "Invoking db cicd shell script"
./dbcicd.sh
echo "Done with cicd shell script"
