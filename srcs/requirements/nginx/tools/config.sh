#!/bin/sh

echo "Generate default Nginx config..."

# chown -R $CONTAINER_USER /var/log/nginx
# chown -R $CONTAINER_USER /var/lib/nginx
# chown -R $CONTAINER_USER /etc/nginx/ssl
# chown -R $CONTAINER_USER /run/nginx

tee /etc/nginx/nginx.conf << EOF
# This file was generated from nginx/tools/default.sh
# user $CONTAINER_USER;
events {
	worker_connections 1024;
}
http {
	server {
		listen 443 ssl;
		listen [::]:443 ssl;

		server_name www.$DOMAIN_NAME $DOMAIN_NAME;

		ssl_certificate $CERTS_;
		ssl_certificate_key $KEYS_;
		ssl_protocols TLSv1.3;

		index index.php;
		root /var/www/html;

		location ~ [^/]\\.php(/|$) {
			try_files \$uri =404;
			fastcgi_pass wordpress:9000;
			include fastcgi_params;
			fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
		}
	}
}
EOF

nginx -g 'daemon off;'