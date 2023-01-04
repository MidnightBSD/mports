PORTNAME=	xearth
PORTVERSION=	1.2
PORTREVISION=	0
CATEGORIES=	astro geography
MASTER_SITES=	FREEBSD_LOCAL/madpilot/xearth

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth
WWW=		https://xearth.org/

LICENSE=	Xearth
LICENSE_NAME=	Xearth license
LICENSE_FILE=	${WRKSRC}/README
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

USES=		tar:xz xorg
USE_XORG=	x11 xext sm ice xt

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/xearth ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/xearth.man ${MANPREFIX}/man/man1/xearth.1
	@${MKDIR} ${PREFIX}/lib/X11/xearth

.include <bsd.port.mk>
