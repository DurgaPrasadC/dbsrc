#!/bin/bash
export /usr/bin/psql

python database_creation.py
sleep 5s

python table_creation.py
sleep 5s

python object_creation.py
sleep 5s

