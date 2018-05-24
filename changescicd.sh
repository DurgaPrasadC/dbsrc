#!/bin/bash

cd /home/ec2-user/gitsrc/dbsrc

cat /dev/null > changescicd_error_log.log
date >> changescicd_error_log.log

git pull origin
sleep 5s

files=`git diff --name-only HEAD@{0} HEAD@{1} | grep .sql`
echo "List of files in diff : $files" >> changescicd_error_log.log
for file in $files; do
  echo "Current file being run : $file" >> changescicd_error_log.log
  echo $PGPASSWORD
  psql -d testdb -h pgdbinstance.c3t0g5fpfejj.us-east-1.rds.amazonaws.com -p 5432 -U testdb -f $file >> changescicd_error_log.log
done

errCount=$(tr -s ' ' '\n' < changescicd_error_log.log | grep ERROR | wc -l)
if [ $errCount -gt 0 ]
then
   echo "Error occurred while applying changes to RDS since last git push."
   cat changescicd_error_log.log
   exit -1
fi
