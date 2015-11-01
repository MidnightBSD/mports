# $MidnightBSD$
# Created by: Palle Girgensohn <girgen@FreeBSD.org>
# $FreeBSD: head/databases/postgresql92-client/Makefile 346217 2014-02-26 17:24:35Z antoine $

PORTNAME=	postgresql
PKGNAMESUFFIX?=	${DISTVERSION:R:S/.//}${COMPONENT}

COMMENT=	PostgreSQL database (client)

MASTERDIR=	${.CURDIR}/../postgresql92-server

BUILD_DIRS=	config src/include src/interfaces src/port \
		src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
		doc src/makefiles
INSTALL_DIRS=	${BUILD_DIRS}

CLIENT_ONLY=	yes
COMPONENT=	-client
USE_LDCONFIG=	yes

USES=		readline

.include "${MASTERDIR}/Makefile"
