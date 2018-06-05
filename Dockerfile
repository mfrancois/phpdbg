FROM php:7.2-cli

RUN echo "deb http://cdn.debian.net/debian/ stretch main contrib non-free" > /etc/apt/sources.list.d/mirror.jp.list
RUN echo "deb http://cdn.debian.net/debian/ stretch-updates main contrib" >> /etc/apt/sources.list.d/mirror.jp.list

RUN /bin/rm /etc/apt/sources.list

# apt-get and system utilities
RUN apt-get update && apt-get install -y \
    curl apt-utils apt-transport-https debconf-utils gcc build-essential zlib1g-dev git libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install -j$(nproc) pgsql pdo_pgsql zip


CMD ["phpdbg", "-qrr"]
