if [ ! -f /var/lib/mysql/data ]; then
	mkdir -p /var/lib/mysql/data
	chown -R mysql:mysql /var/lib/mysql
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld/
	touch /run/mysqld/mysqld.sock
	chown -R mysql:mysql /run/mysqld/mysqld.sock
	mariadb-install-db --user=root \
		--datadir=/var/lib/mysql
	mariadbd --bootstrap <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$(cat /run/secrets/db_password)';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF
fi
exec mariadbd --user=root
