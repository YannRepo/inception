#!/bin/sh

# Creation of mysql database if not existing (contain user list)
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm
	chown -R mysql:mysql /var/lib/mysql
fi

# Creation of wordpress database if not existing
if [ ! -d "/var/lib/mysql/wordpress" ]; then
	#script creation in a heredoc to include critical by env variable
	#and avoid visibility
	cat << EOF > /tmp/querys_database.sql
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE user='';
DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '${MDB_USER_NAME}'@'%' IDENTIFIED BY '${MDB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON wordpress.* TO '${MDB_USER_NAME}'@'%';
FLUSH PRIVILEGES;
EOF

	chmod 777 /tmp/querys_database.sql
	mysqld --user=mysql --verbose --bootstrap < /tmp/querys_database.sql
	rm -f /tmp/querys_database.sql
fi
# Lauch deamon mysql
exec mysqld
