
# Initial Setup
sudo apt-get update
cd /tmp/

# Setup LAMP Server
## Apache
sudo apt-get install apache2 -y

## PHP
sudo apt-get php5 libapache2-mod-php5 -y
sudo /etc/init.d/apache2 restart

## MySQL
sudo apt-get install mysql-server -y
sudo apt-get install mysql-admin -y
mysqladmin -u developer -p create acquia-database
mysql -u developer -p acquia-database < "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, INDEX, DROP, CREATE TEMPORARY TABLES, LOCK TABLES ON acquia-database.* TO 'developer'@'localhost' IDENTIFIED BY 'r@z0rf1sh'; FLUSH PRIVILEGES;"

# Setup Acquia
## Get Acquia
cd /server-root/
sudo aptitude install git -y
git clone git://git.acquia.com/drupal/branches/7.x.git acquia

## Install Acquia
cd acquia/
mkdir ./sites/default/files
touch ./sites/default/settings.php
chmod a+rw ./sites/default/settings.php
chmod a+rwx ./sites/default/files