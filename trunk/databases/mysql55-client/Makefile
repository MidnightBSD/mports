# $MidnightBSD$

PORTNAME=	mysql
PKGNAMESUFFIX=	55-client
PORTREVISION=	0

COMMENT=	Multithreaded SQL database (client)

MASTERDIR=	${.CURDIR}/../mysql55-server

PKGMESSAGE=	mustnotexist
PATCHDIR=	${.CURDIR}/files
PLIST=		${.CURDIR}/pkg-plist

CONFLICTS_INSTALL=	mysql5.[0-46-9]-client-* mysql[0-46-9][0-9]-client-* mariadb[0-9][0-9]-client-* percona[0-9][0-9]-client-*

CMAKE_ARGS+=	-DWITHOUT_SERVER=1 -DENABLE_DTRACE:BOOL=OFF

USE_LDCONFIG=	${PREFIX}/lib/mysql

CLIENT_ONLY=	yes

.include "${MASTERDIR}/Makefile"
