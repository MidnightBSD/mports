# $MidnightBSD$

PORTNAME=	wmstock
PORTVERSION=	0.11
PORTREVISION=	1
CATEGORIES=	finance windowmaker
MASTER_SITES=	http://www.mattfischer.com/wmstock/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker Dockapp that shows stock ticker(s)

LICENSE=	gpl2

USE_XORG=	xpm

USES=		gmake
WRKSRC=		${WRKDIR}/wmstock/src

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmstock ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/getquote ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmstock.1x ${PREFIX}/man/man1/wmstock.1

.include <bsd.port.mk>
