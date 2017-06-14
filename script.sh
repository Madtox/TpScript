cd Bureau
mkdir Docker

# MYSQL
echo "docker run --name mysql -e MYSQL_ROOT_PASSWORD=0000 -d mysql:latest"
echo "sudo docker exec -it mysql /bin/bash"
echo "apt-get -y install mysql-server"
echo "exit"

# APACHE + LINK
echo "sudo docker run -dit --name apache --link mysql -v "$PWD":/usr/local/apache2/htdocs/ httpd:latest"

# DockerApacheID = echo "sudo docker ps --filter "name=apache" -q"
# DockerSQLID = echo "sudo docker ps --filter "name=mysql" -q"

# WORDPRESS
echo "curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
echo "chmod +x wp-cli.phar"
echo "sudo mv wp-cli.phar /usr/local/bin/wp"

echo "wp core download --locale=fr_FR --force"
echo "wp core version"
echo "wp core config --dbname=$1 --dbuser=root --dbpass=root --skip-check --extra-php <<PHP"
echo "define( 'WP_DEBUG', true );"
echo "PHP"
echo "wp db create"

echo "passgen=`head -c 10 /dev/random | base64`"
echo "password=${passgen:0:10}"
echo "# install"
echo "wp core install --url=$url --title="$2" --admin_user=$admin --admin_email=$email --admin_password=$password"
