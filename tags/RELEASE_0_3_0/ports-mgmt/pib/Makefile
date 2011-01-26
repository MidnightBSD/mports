# New ports collection makefile for:    pib
# Date created:         16 Oct 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/ports-mgmt/pib/Makefile,v 1.4 2008/06/24 20:28:58 laffer1 Exp $
#

PORTNAME=	pib
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	ports-mgmt tk
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	msmith

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI Ports Collection management tool
LICENSE=	bsd2

USE_TCL=	84
USE_TCL_BUILD=	84
USE_TK=		84
USE_TK_BUILD=	84

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/lib/pib
	${INSTALL_SCRIPT} ${WRKSRC}/*.tcl ${PREFIX}/lib/pib
	${INSTALL_DATA} ${WRKSRC}/libTkSteal.so.2* ${PREFIX}/lib/pib
	${LN} -fs ${PREFIX}/lib/pib/pib.tcl ${PREFIX}/bin/pib

.include <bsd.port.post.mk>
