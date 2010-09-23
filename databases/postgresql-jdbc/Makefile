# $MidnightBSD$

PORTNAME=	postgresql
PORTVERSION=	8.3.603
DISTVERSIONSUFFIX=.src
CATEGORIES=	databases java
MASTER_SITES=	http://jdbc.postgresql.org/download/
PKGNAMESUFFIX=	-jdbc
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${DISTVERSION:C/.([0-9][0-9][0-9]*)/-\1/g}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Java JDBC implementation for PostgreSQL
LICENSE=	bsd3

DIST_SUBDIR=	postgresql

USE_ANT=	yes
USE_JAVA=	yes

PKGMESSAGE=	${WRKDIR}/.pkg-message

post-patch:
	${REINPLACE_CMD} 's,/usr/local/pgsql/share/java,${JAVAJARDIR},' ${WRKSRC}/README

do-install:
	@ ${INSTALL_DATA} ${WRKSRC}/jars/postgresql.jar ${JAVAJARDIR}/postgresql.jar
.if !defined(NOPORTDOCS)
	@ ${MKDIR} -m 0755 ${DOCSDIR} ;\
	  ${INSTALL_DATA} ${WRKSRC}/README \
			  ${DOCSDIR}/README-jdbc
.endif

.include <bsd.port.mk>
