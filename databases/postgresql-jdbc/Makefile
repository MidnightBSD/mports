# $MidnightBSD$

PORTNAME=	postgresql
PORTVERSION=	9.2.1004
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
NO_ARCH=	yes

PLIST_FILES=	%%JAVAJARDIR%%/postgresql.jar
PORTDOCS=	*
DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}${PKGNAMESUFFIX}
SUB_FILES=	pkg-message

OPTIONS_DEFINE=	DOCS
OPTIONS_SUB=	yes

post-patch:
	${REINPLACE_CMD} 's,/usr/local/pgsql/share/java,${JAVAJARDIR},' ${WRKSRC}/README

.include <bsd.mport.options.mk>

do-install:
	@ ${INSTALL_DATA} ${WRKSRC}/jars/postgresql.jar ${JAVAJARDIR}/postgresql.jar
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif

.include <bsd.port.mk>
