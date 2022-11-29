FROM alpine:3.17.0

RUN \
    echo "**** install packages ****" && \
    apk add -U --upgrade --no-cache \
        alpine-sdk \
        autoconf \
        libtool \
        bison \
        re2c \
        libxml2-dev \
        sqlite-dev \
        bison && \
    echo "**** setup build environmont ****" && \
    git clone https://github.com/php/php-src.git --depth=1 --branch=PHP-8.2.0 && \
    cd ./php-src && \
    ./buildconf && \
    ./configure
VOLUME /test_results
