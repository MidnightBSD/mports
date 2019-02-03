# Created by: Palle Girgensohn <girgen@FreeBSD.org>
# $FreeBSD: head/databases/postgresql96-client/Makefile 421361 2016-09-05 11:59:32Z girgen $
# $MidnightBSD$

PORTNAME=	postgresql
PORTREVISION=	0
PKGNAMESUFFIX=	96-client

COMMENT=	PostgreSQL database (client)

MASTERDIR=	${.CURDIR}/../postgresql96-server

BUILD_DIRS=	config src/include src/interfaces src/port \
		src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
		src/bin/pgbench doc src/makefiles src/test/regress
INSTALL_DIRS=	${BUILD_DIRS}

CLIENT_ONLY=	yes
COMPONENT=	-client
USE_LDCONFIG=	yes
USES=		pkgconfig

.include "${MASTERDIR}/Makefile"
