if [ ! -f /var/lib/mysql/data ]; then
    mkdir -p /var/lib/mysql/data
    chown -R mysql:mysql /var/lib/mysql
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld/
    touch /run/mysqld/mysqld.sock
    chown -R mysql:mysql /run/mysqld/mysqld.sock
    mariadb-install-db --user=mysql \
        --datadir=/var/lib/mysql
fi
exec mariadbd --user=mysql
