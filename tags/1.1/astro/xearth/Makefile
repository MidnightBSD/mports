# $MidnightBSD$

PORTNAME=	xearth
PORTVERSION=	1.2
PORTREVISION=	0
CATEGORIES=	astro geography
MASTER_SITES=	http://seis.bris.ac.uk/~mexas/ \
		FREEBSD_LOCAL/madpilot/xearth

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth

LICENSE=	mit_restricted
LICENSE_NAME=	mit with patents
LICENSE_TEXT=	MIT license with patents
LICENSE_PERMS=	# perms?

RESTRICTED=	patents?

USES=		tar:xz
USE_XORG=	x11 xext sm ice xt

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/xearth ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/xearth.man ${MANPREFIX}/man/man1/xearth.1
	@${MKDIR} ${PREFIX}/lib/X11/xearth

.include <bsd.port.mk>
