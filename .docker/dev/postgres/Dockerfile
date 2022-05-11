FROM postgres:10-alpine


RUN mkdir /etc/supervisor.d
RUN mkdir /docker
WORKDIR /docker
ENV PG_MAJOR 10
ENV PG_VERSION 10.20
ENV PG_SHA256 87de16d59bcfe42fa605c312c59be5e294e8a3e6acb655dd7ad47cbb930a659f

RUN apk update

RUN apk add --no-cache --virtual .build-deps \
		bison \
		coreutils \
		dpkg-dev dpkg \
		flex \
		gcc \
		krb5-dev \
		libc-dev \
		libedit-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		openldap-dev \
		openssl-dev \
		perl-dev \
		perl-ipc-run \
		perl-utils \
		python3-dev \
		tcl-dev \
		util-linux-dev \
		zlib-dev \
		supervisor \
		nano\
		icu-dev\
		postgres --version


#COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 5432
CMD ["postgres"]