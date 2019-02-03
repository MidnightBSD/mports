# $MidnightBSD$

PORTNAME=	xspy
PORTVERSION=	1.0c
PORTREVISION=	3
CATEGORIES=	security
MASTER_SITES=	http://www.acm.vt.edu/~jmaxwell/programs/xspy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility for monitoring keystrokes on remote X servers

LICENSE=	other

WRKSRC=		${WRKDIR}/${PORTNAME}
USES=		imake:notall
USE_XORG=	x11

ALL_TARGET=	xspy

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xspy ${PREFIX}/bin

.include <bsd.port.mk>
