#!/bin/bash

PGHOST="pgdbinstance.c3t0g5fpfejj.us-east-1.rds.amazonaws.com"
PGPORT="5432"
PGDATABASE="testdb"
PGUSER="testdb"
PGPASSWORD="testdb"
NO_OF_CORES=2
PSQL="/usr/local/bin/psql"

export PGPASSWORD=testdb

BASE_FOLDER='/home/ec2-user/rdscicd/test-db/testschema/Constraints/'
echo 'Postgres code basefolder=' $BASE_FOLDER