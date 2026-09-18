# cp wp-config-sample.php wp-config.php
# sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$DB_NAME' );/" wp-config.php
# sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/" wp-config.php
# sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$(cat /run/secrets/db_password)' );/" wp-config.php
# sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/" wp-config.php
# wp --info
until mariadb-admin ping -h mariadb -u"$MYSQL_USER" -p"$(cat /run/secrets/db_password)" --silent; do
    sleep 2
done

if [ ! -f /var/www/html/wp-config.php ]; then
    cd /var/www/html
    wp config create --allow-root --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$(cat /run/secrets/db_password) --dbhost=mariadb --locale=de_DE
    # wp core download --locale=de_DE --allow-root
    wp core install --allow-root --url=$DOMAIN_NAME --title=Example --admin_user=$MYSQL_ADMIN --admin_password=$(cat /run/secrets/wp_password_ad) --admin_email=info@example.com
fi

exec /usr/sbin/php-fpm84 -F
