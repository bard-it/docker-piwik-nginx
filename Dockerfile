FROM piwik:3

RUN apt-get -y update && apt-get -y install nginx-light
COPY nginx.conf /etc/nginx/
COPY zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]
