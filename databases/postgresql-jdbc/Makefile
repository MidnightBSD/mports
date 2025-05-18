PORTNAME=	postgresql
PORTVERSION=	42.7.5
CATEGORIES=	databases java
MASTER_SITES=	http://jdbc.postgresql.org/download/
PKGNAMESUFFIX=	-jdbc
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java JDBC implementation for PostgreSQL
WWW=		https://jdbc.postgresql.org/

LICENSE=	bsd3

USES=		java
NO_ARCH=	yes
PLIST_FILES=	%%JAVAJARDIR%%/postgresql.jar

do-extract:

do-build:

do-install:
	${INSTALL_DATA} ${DISTDIR}/${DISTFILES} ${STAGEDIR}${JAVAJARDIR}/postgresql.jar

.include <bsd.port.mk>
