# New ports collection makefile for:    pib
# Date created:         16 Oct 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$
#

PORTNAME=	pib
PORTVERSION=	1.2
CATEGORIES=	ports-mgmt
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=	msmith

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GUI Ports Collection management tool

USE_TK=		yes
USE_TK_BUILD=	yes

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/lib/pib
	${INSTALL_SCRIPT} ${WRKSRC}/*.tcl ${PREFIX}/lib/pib
	${INSTALL_DATA} ${WRKSRC}/libTkSteal.so.2* ${PREFIX}/lib/pib
	${LN} -fs ${PREFIX}/lib/pib/pib.tcl ${PREFIX}/bin/pib

.include <bsd.port.post.mk>
