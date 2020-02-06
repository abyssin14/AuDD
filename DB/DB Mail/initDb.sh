#!/bin/bash

# Initialisation

service mysql start

mysql -u root --password=ephec_audd

# Create the database

mysql --password=ephec_audd < /tmp/db_schema.sql

# start db

mysqladmin --password=ephec_audd shutdown
