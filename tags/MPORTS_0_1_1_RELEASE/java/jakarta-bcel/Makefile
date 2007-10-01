# Ports collection makefile for:	jakarta-bcel
# Date created:				6 May 2002
# Whom:					des
# $MidnightBSD$
# $FreeBSD: ports/java/jakarta-bcel/Makefile,v 1.4 2006/05/24 14:00:57 hq Exp $
#

PORTNAME=	bcel
PORTVERSION=	5.1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_JAKARTA}
MASTER_SITE_SUBDIR=	${PORTNAME}/binaries
PKGNAMEPREFIX=	jakarta-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for generating Java bytecode

NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.2+

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.jar \
	    ${JAVAJARDIR}/${PORTNAME}.jar
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs && ${FIND} . -print | \
	    ${CPIO} -pdmu -R${DOCOWN}:${DOCGRP} ${DOCSDIR})
.endif

.include <bsd.port.mk>
