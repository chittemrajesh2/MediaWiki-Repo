                ssh server_name@ip-addess
                sudo apt update
                sudo apt upgrade -y

                # Install the LAMP Stack on the Raspberry Pi
                sudo apt-get install -y apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring php-apcu php-intl imagemagick inkscape php-gd php-cli php-curl php-bcmath git
                sudo service apache2 reload

                # Download and extract MediaWiki
                cd /tmp/
                wget https://releases.wikimedia.org/mediawiki/1.36/mediawiki-1.36.1.tar.gz
                tar -xvzf /tmp/mediawiki-*.tar.gz
                sudo mkdir /var/lib/mediawiki
                sudo mv mediawiki-*/* /var/lib/mediawiki
                sudo ln -s /var/lib/mediawiki /var/www/html/mediawiki

                # Configuring the MariaDB Database
                sudo mysql -u root -p <<EOF
                CREATE USER 'chittiadmin'@'localhost' IDENTIFIED BY 'mediawikichitti';
                CREATE DATABASE chittidb_wiki;
                USE chittidb_wiki;
                GRANT ALL ON hendgrow_wiki.* TO 'chittiadmin'@'localhost';
                COMMIT;
                QUIT;

                # Print final message with instructions to access MediaWiki
                echo -e "\nOpen your web browser and navigate to your server:"
                echo "Example: http://your-ip-address/mediawiki/"
                echo "Our example: http://192.168.36.98/mediawiki/"
