# $MidnightBSD$
# $FreeBSD: ports/java/jakarta-bcel/Makefile,v 1.4 2006/05/24 14:00:57 hq Exp $

PORTNAME=	bcel
PORTVERSION=	5.2
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_JAKARTA}
MASTER_SITE_SUBDIR=	${PORTNAME}/binaries
PKGNAMEPREFIX=	jakarta-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for generating Java bytecode
LICENSE=	apache2

NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.6+

PLIST_FILES=	%%JAVAJARDIR%%/bcel.jar

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.jar \
	    ${JAVAJARDIR}/${PORTNAME}.jar
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs && ${FIND} . -print | \
	    ${CPIO} -pdmu -R${DOCOWN}:${DOCGRP} ${DOCSDIR})
.endif

.include <bsd.port.mk>
