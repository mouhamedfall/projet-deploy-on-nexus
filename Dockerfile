FROM mysql:5.7.18
MAINTAINER Mouhamed Fall <mouhamed.fall@b-com.com>

# set database credentials
ENV MYSQL_USER=root \
    MYSQL_ROOT_PASSWORD=change-me \
    MYSQL_DATABASE=oai_db

EXPOSE 3306
VOLUME ["/var/lib/mysql"]
ADD oai_db.sql /docker-entrypoint-initdb.d