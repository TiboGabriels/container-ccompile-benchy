FROM debian:stable-20221114

COPY ./run_test_debian.sh ./run_test.sh 
RUN \
    echo "**** install packages ****" && \
    apt-get update -y && apt-get upgrade -y && \
    apt-get install -y \
        git \
        time \
        bc \
        pkg-config \
        build-essential \
        autoconf \
        libtool \
        bison \
        re2c \
        libxml2-dev \
        libsqlite3-dev \
        procps \
        sysstat \
        bison && \
    echo "**** setup build environmont ****" && \
    git clone https://github.com/php/php-src.git --depth=1 --branch=PHP-8.2.0 && \
    cd ./php-src && \
    ./buildconf && \
    ./configure
VOLUME ["/php-src/test_results"]
