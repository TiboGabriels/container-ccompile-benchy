FROM alpine:3.17.0

COPY ./run_test_alpine.sh ./run_test.sh 
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
        procps \
        sysstat \
        bison && \
    echo "**** setup build environmont ****" && \
    git clone https://github.com/php/php-src.git --depth=1 --branch=PHP-8.2.0 && \
    cd ./php-src && \
    ./buildconf && \
    ./configure
VOLUME ["/php-src/test_results"]
