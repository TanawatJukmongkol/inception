#!/bin/sh

service mysql start

mariadb -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME