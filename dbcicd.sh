#!/bin/bash
export /usr/bin/psql

cd deployment-script

echo "Invoking db creation script"
python database_creation.py
sleep 5s

echo "Invoking table creation script"
python table_creation.py
sleep 5s

echo "Invoking object creation script"
python object_creation.py
sleep 5s
