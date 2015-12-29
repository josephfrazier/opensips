FROM debian:jessie

# package list derived from ./packaging/debian/control
RUN apt-get clean && apt-get update && apt-get install -y \
      bison \
      debhelper \
      dh-systemd \
      dh-python \
      dpkg-dev \
      flex \
      libconfuse-dev \
      libcurl4-gnutls-dev \
      libdb-dev \
      libexpat1-dev \
      libfreeradius-client-dev \
      libgeoip-dev \
      libhiredis-dev \
      libjson0-dev \
      libldap2-dev \
      liblua5.1-dev \
      libmemcached-dev \
      libmicrohttpd-dev \
      libmysqlclient-dev \
      libncurses5-dev \
      libpcre3-dev \
      libperl-dev \
      libpq-dev \
      librabbitmq-dev \
      libsctp-dev \
      libsnmp-dev \
      libxml2-dev \
      libxmlrpc-core-c3-dev \
      pkg-config \
      python \
      unixodbc-dev \
      xsltproc \
      zlib1g-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

ENV srcdir /usr/local/src/opensips
COPY . $srcdir
WORKDIR $srcdir

RUN make all && make install
