PORTNAME=	wmstock
PORTVERSION=	0.11
PORTREVISION=	2
CATEGORIES=	finance windowmaker
MASTER_SITES=	http://www.mattfischer.com/wmstock/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WindowMaker Dockapp that shows stock ticker(s)

LICENSE=	gpl2

USE_XORG=	xpm

CFLAGS+=	-fcommon

USES=		gmake xorg
WRKSRC=		${WRKDIR}/wmstock/src

DEPRECATED=  Unmaintained and dead upstream, does not build with -fno-common (llvm 11)
EXPIRATION_DATE=2021-04-01

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmstock ${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/getquote ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/wmstock.1x ${PREFIX}/man/man1/wmstock.1

.include <bsd.port.mk>
