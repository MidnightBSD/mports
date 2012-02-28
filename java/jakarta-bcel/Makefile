# Ports collection makefile for:	jakarta-bcel
# Date created:				6 May 2002
# Whom:					des
# $MidnightBSD: mports/java/jakarta-bcel/Makefile,v 1.3 2008/05/01 23:18:23 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-bcel/Makefile,v 1.4 2006/05/24 14:00:57 hq Exp $
#

PORTNAME=	bcel
PORTVERSION=	5.2
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_JAKARTA}
MASTER_SITE_SUBDIR=	${PORTNAME}/binaries
PKGNAMEPREFIX=	jakarta-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for generating Java bytecode
LICENSE=	apache2

USE_GCPIO=	yes
NO_BUILD=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.jar \
	    ${JAVAJARDIR}/${PORTNAME}.jar
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/docs && ${FIND} . -print | \
	    ${CPIO} -pdmu -R${DOCOWN}:${DOCGRP} ${DOCSDIR})

.include <bsd.port.mk>
