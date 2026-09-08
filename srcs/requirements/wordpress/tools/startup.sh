#cd /var/www/html
#cp wp-config-sample.php wp-config.php
#sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '$MYSQL_DB_NAME' );/" wp-config.php
#sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '$MYSQL_USER' );/" wp-config.php
#sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '$(cat /run/secrets/db_password)' );/" wp-config.php

exec /usr/sbin/php-fpm84 -F
