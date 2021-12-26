# -- DEBUT COUCHE OS ----------------------------------------------------------
FROM debian:stable-slim

# -- METADONNEES DE L'IMAGE ---------------------------------------------------
LABEL version="1.0" maintainer="MUGANZA Gilles <gillesmg13@gmail.com>"

# -- VARIABLES TEMPORAIRES ----------------------------------------------------
ARG APT_FLAGS="-q -y"
ARG DOCUMENTROOT="/var/www/html"

# -- DEBUT COUCHE APACHE ------------------------------------------------------
RUN apt-get update -y && \
    apt-get install ${APT_FLAGS} apache2
# -- FIN COUCHE APACHE --------------------------------------------------------

# -- DEBUT COUCHE MYSQL -------------------------------------------------------
RUN apt-get install ${APT-FLAGS} mariadb-server

COPY db/articles.sql /
# -- FIN COUCHE MYSQL ---------------------------------------------------------

# -- DEBUT COUCHE PHP ---------------------------------------------------------
RUN apt-get install ${APT_FLAGS} \
    php-mysql \
    php && \
    rm -f £{DOCUMENTROOT}/index.html && \
    apt-get autoclean -y

COPY app ${DOCUMENTROOT}
# -- FIN COUCHE PHP -----------------------------------------------------------

# -- OUVERTURE DU PORT HTTP
EXPOSE 80

# -- REPERTOIRE DE TRAVAIL
WORKDIR ${DOCUMENTROOT}

# -- DEMARRAGE DES SERVICES LORS DE L'EXECUTION DE L'IMAGE
ENTRYPOINT service mysql start && mysql < /articles.sql && apache2ctl -D FOREGROUND