FROM ubuntu:21.04
RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install ssh apache2-bin apache2-data apache2-utils init apache2 wget npm apache2 php php-curl  mysql-server php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring  php-xml php-pear php-bcmath  -y
RUN npm install -g wstunnel
RUN mkdir /run/sshd 
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_wstunnel
RUN a2enmod  rewrite
RUN wget https://raw.githubusercontent.com/tixiaohan123/server_pro/main/000-default.conf
RUN rm /etc/apache2/sites-available/000-default.conf
RUN mv 000-default.conf /etc/apache2/sites-available
RUN echo 'You can play your Railway Cloud NOW!- Message From A Code Builder TTMN!' >/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:8989 & ' >>/run.sh
RUN echo 'service mysql restart' >>/run.sh
RUN echo 'service apache2 restart' >>/run.sh
RUN echo '/usr/sbin/sshd -D' >>/run.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:tixiaohan|chpasswd
RUN chmod 755 /run.sh
EXPOSE 80
CMD  /run.sh
