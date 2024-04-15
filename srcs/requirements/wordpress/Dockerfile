FROM debian:buster

RUN		apt update; \
		apt install -y tar curl php7.3-fpm php7.3-mysql mariadb-server mariadb-client sendmail

ARG		DOMAIN_NAME

ARG		DB_HOST
ARG		DB_NAME
ARG		DB_USER
ARG		DB_PASSWORD
ARG		WP_EMAIL

COPY	tools/setup.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/setup.sh

# Install wp-cli
RUN		mkdir -p /var/www/html
RUN		rm -rf /var/www/html/*
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin

COPY	conf/wp-config.php /var/www/html
COPY	conf/vertice.1.0.20.zip /var/www/html
COPY	conf/www.conf /etc/php/7.3/fpm/pool.d

RUN		cd /var/www/html; \
		sed -i 's/$DB_NAME/'${DB_NAME}'/' wp-config.php; \
		sed -i 's/$DB_USER/'${DB_USER}'/' wp-config.php; \
		sed -i 's/$DB_PASSWORD/'${DB_PASSWORD}'/' wp-config.php; \
		sed -i 's/$DB_HOST/'${DB_HOST}'/' wp-config.php; \
		sed -i 's/$WP_SITEURL/https:\/\/'${DOMAIN_NAME}'/' wp-config.php;

# Install WordPress
RUN		cd /var/www/html; \
		wp-cli.phar cli update --yes --allow-root; \
		wp-cli.phar --allow-root core download;

RUN		chmod 777 -R /var/www/html

EXPOSE	9000

CMD	[ "setup.sh" ]