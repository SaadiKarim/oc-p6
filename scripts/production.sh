apt-get update
apt upgrade -y
apt install wget unzip -y
apt install -y php php-bcmath php-cli php-curl php-zip php-sqlite3 php-mysql php-xml php-mbstring
wget https://getcomposer.org/composer.phar
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer
