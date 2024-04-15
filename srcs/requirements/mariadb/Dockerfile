FROM debian:buster

RUN apt update; \
	apt install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld; \
	chown -R mysql:mysql /var/run/mysqld; \
	chmod 777 /var/run/mysqld

EXPOSE 3306

COPY	./conf/mariadb-server.cnf /etc/mysql/mariadb.conf.d

# For login shell in makefile. Run `make mariadb` to login into the db.
COPY	./tools/shell.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/shell.sh

COPY	./tools/entrypoint.sh /usr/local/bin
RUN		chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh" ]