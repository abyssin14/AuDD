# Image de Ubuntu

FROM ubuntu:18.04

# Maintainer

MAINTAINER "m.ndamtang@students.ephec.be"

# Password definition

RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password password '"]

RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '" ]

# Installation et mise a jour

RUN apt-get update -y \

        && apt-get install -y mysql-server

# Copie des fichiers bash && config & Copy of the schema of the database

COPY initDb.sh db_schema.sql entrypoint.sh /tmp/
COPY mysqld.cnf /etc/mysql/mysql.conf.d/

COPY mysqld.cnf /etc/mysql/mysql.conf.d/

RUN chmod +x /tmp/initDb.sh && chmod +x /tmp/entrypoint.sh

RUN /tmp/initDb.sh

# Expose

EXPOSE 3306/tcp

# Entrypoint

ENTRYPOINT "/tmp/entrypoint.sh"
