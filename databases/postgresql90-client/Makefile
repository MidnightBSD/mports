# $MidnightBSD$
# $FreeBSD: ports/databases/postgresql90-client/Makefile,v 1.4 2010/12/31 09:57:21 mm Exp $
#
# To depend on postgresql-client, set USE_PGSQL=yes.

PORTNAME=	postgresql
PKGNAMESUFFIX=	-client

COMMENT=	PostgreSQL database (client)

MASTERDIR=	${.CURDIR}/../postgresql90-server

BUILD_DIRS=	config src/include src/interfaces src/port \
		src/bin/pg_dump src/bin/psql src/bin/scripts src/bin/pg_config \
		doc src/makefiles
CLIENT_ONLY=	yes
USE_LDCONFIG=	yes

.include "${MASTERDIR}/Makefile"
