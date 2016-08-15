# ports collection makefile for:	jfconv
# Date created:			14 May 2000
# Whom:				Akinori MUSHA aka knu <knu@idaemons.org>
#
# $FreeBSD: ports/palm/jfconv/Makefile,v 1.11 2005/11/11 01:17:46 linimon Exp $
# $MidnightBSD$
#

PORTNAME=	jfconv
PORTVERSION=	2000.05.17
CATEGORIES=	palm databases
MASTER_SITES=	${MASTER_SITE}
DISTNAME=	jconv
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts JFile database to CSV, and vice versa
LICENSE=	gpl2

ALL_TARGET=	# none

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/jconv ${PREFIX}/bin/jfconv
.if !defined(NOPORTDOCS)
	${MKDIR} ${PREFIX}/share/doc/jfconv/
	${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/jfconv/
.endif

.include <bsd.port.mk>
