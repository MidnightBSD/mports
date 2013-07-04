# $MidnightBSD: mports/astro/xearth/Makefile,v 1.10 2012/03/11 04:36:15 laffer1 Exp $

PORTNAME=	xearth
PORTVERSION=	1.2
PORTREVISION=	0
CATEGORIES=	astro geography
MASTER_SITES=	http://seis.bris.ac.uk/~mexas/ \
		FREEBSD_LOCAL/madpilot/xearth

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth
LICENSE=	restricted
#patents?

USE_XORG=	x11 xext sm ice xt
USE_XZ=		yes
MAN1=		xearth.1

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/xearth ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/xearth.man ${MANPREFIX}/man/man1/xearth.1
	@${MKDIR} ${PREFIX}/lib/X11/xearth

.include <bsd.port.mk>
