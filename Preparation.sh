#!/bin/bash

# Add the repository 'ppa:ondrej/apache2'
apt install -y software-properties-common
add-apt-repository -y ppa:ondrej/apache2
apt update

# Install PHP 7.2 & Apache
apt install -y apache2
apt install -y php7.2 php7.2-cli libapache2-mod-php7.2
apt install -y php-imagick php-gettext php-memcache php-apcu php-pear php-xml php-xmlrpc
apt install -y php-memcached php-mysql php-intl php-mbstring php-curl php-gd
apt install -y php7.2-common php7.2-mysql php7.2-cgi 
apt install -y php7.2-curl php7.2-zip php7.2-mbstring php7.2-xmlrpc php7.2-gd php7.2-xml php7.2-xsl
apt install -y php7.2-dev php7.2-bz2 php7.2-intl php7.2-json php7.2-opcache php7.2-readline php7.2-bcmath
apt install -y php7.2-imap php7.2-pspell php7.2-recode php7.2-sqlite3 php7.2-tidy php7.2-pgsql
apt install -y composer
composer global require laravel/installer
cd /payGOBackendTest/adminpanel && composer require backpack/crud && composer require phpoffice/phpspreadsheet && composer require maatwebsite/excel
cp envconfig .env
php artisan backpack:base:install
php artisan backpack:crud:install --no-interaction
php artisan migrate
php artisan backpack:base:add-sidebar-content "<li><a href='{{ backpack_url('empleado') }}'><i class='fa fa-users'></i> <span>Empleados</span></a></li>"
# Enable PHP 7.2 in Apache
a2enmod php7.2
service apache2 restart

# Update the CLI PHP version
update-alternatives --set php /usr/bin/php7.2
