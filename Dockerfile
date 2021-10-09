FROM ubuntu
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y apache2  php   openssl   php-common php-mbstring  php-xml php-mysqlnd php-gd  php-pdo php-curl  vim  && apt-get clean
RUN sed -i 's/max_execution_time = 30/max_execution_time = 1500/g' /etc/php/7.4/apache2/php.ini
RUN ln -sf /dev/stdout /var/log/apache2/access_log \
&& ln -sf /dev/stderr /var/log/apache2/error_log
EXPOSE 80 443
CMD ["apachectl", "-D", "FOREGROUND"]
