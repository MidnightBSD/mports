# $MidnightBSD: mports/security/xspy/Makefile,v 1.2 2009/05/01 15:22:40 laffer1 Exp $

PORTNAME=	xspy
PORTVERSION=	1.0c
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	http://www.acm.vt.edu/~jmaxwell/programs/xspy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A utility for monitoring keystrokes on remote X servers
LICENSE=	other

WRKSRC=		${WRKDIR}/${PORTNAME}
USE_IMAKE=	yes
USE_XORG=	x11
XMKMF=		xmkmf

ALL_TARGET=	xspy

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xspy ${PREFIX}/bin

.include <bsd.port.mk>
