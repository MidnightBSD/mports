# New ports collection makefile for:	wmstock
# Date created:		19 Jun 1999
# Whom:			Will Andrews <andrews@technologist.com>
#
# $MidnightBSD: mports/finance/wmstock/Makefile,v 1.1 2007/09/20 02:53:38 laffer1 Exp $
# $FreeBSD: ports/finance/wmstock/Makefile,v 1.16 2007/05/19 20:04:58 flz Exp $
#

PORTNAME=	wmstock
PORTVERSION=	0.11
CATEGORIES=	finance windowmaker
MASTER_SITES=	http://mattfischer.com/wmstock/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker Dockapp that shows stock ticker(s)
LICENSE=        gpl2
USE_XLIB=	yes
USE_X_PREFIX=	yes
USE_XPM=	yes

WRKSRC=		${WRKDIR}/wmstock/src
USE_GMAKE=	yes
MAN1=		wmstock.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmstock ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/getquote ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmstock.1x ${PREFIX}/man/man1/wmstock.1

.include <bsd.port.mk>
