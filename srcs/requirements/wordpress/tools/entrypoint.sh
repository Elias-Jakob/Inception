# cd /var/www/html
# cp wp-config-sample.php wp-config.php
# sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$DB_NAME' );/" wp-config.php
# sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/" wp-config.php
# sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$(cat /run/secrets/db_password)' );/" wp-config.php
# sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb' );/" wp-config.php
wp --info
wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$(cat /run/secrets/db_password) --dbhost=mariadb --local=de_DE
wp core download --local=de_DE
wp core install --url=$DOMAIN_NAME --title=Example --admin_user=$MYSQL_ADMIN --admin_password=$(cat /run/secrets/wp_password_ad) --admin_email=info@example.com

exec /usr/sbin/php-fpm84 -F
