# New ports collection makefile for:		gnu-regexp
# Date created:					December 6th 2000
# Whom:						des
#
# $MidnightBSD$
# $FreeBSD: ports/java/gnu-regexp/Makefile,v 1.11 2005/02/03 02:03:56 hq Exp $
#

PORTNAME=	gnu-regexp
PORTVERSION=	1.1.4
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	ftp://ftp.tralfamadore.com/pub/java/
DISTNAME=	gnu.regexp-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A regexp library for Java
LICENSE=	gpl2

USE_GCPIO=	yes
USE_JAVA=	yes
NO_BUILD=	yes

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar

do-install:
	${INSTALL_DATA} ${WRKSRC}/lib/${PORTNAME}-${PORTVERSION}.jar \
	    ${JAVAJARDIR}/${PORTNAME}.jar
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC}/docs && ${FIND} . \
	    | ${CPIO} -pdmu -R ${DOCOWN}:${DOCGRP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
