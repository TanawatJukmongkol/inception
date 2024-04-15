#!/bin/sh

service mysql start

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
	echo "Database already exists"
else

echo "Install database..."

mysql_secure_installation << EOF

n
y
y
y
y
EOF

echo "Configure privilege..."

mariadb -u root <<  EOF
CREATE DATABASE $DB_NAME ;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES ;
SHOW GRANTS FOR '$DB_USER'@'%';
EOF

echo "Done!"

fi

chmod 777 -R /var/lib/mysql

echo "Restart mysql daemon to be run as forground..."
service mysql stop
mysqld
