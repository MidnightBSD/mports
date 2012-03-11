# $MidnightBSD: mports/astro/xearth/Makefile,v 1.9 2009/05/31 17:09:23 laffer1 Exp $

PORTNAME=	xearth
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	astro geography
MASTER_SITES=	XCONTRIB/applications \
		http://seis.bris.ac.uk/~mexas/ \
		FREEBSD_LOCAL/simon

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the root window to the image of earth
LICENSE=	restricted
#patents?

MAKE_ENV+=	OSREL=6.1

USE_XORG=	x11 xext sm ice xt
USE_IMAKE=	yes

MAN1=		xearth.1

post-configure:
	${REINPLACE_CMD} -e 's/-lxpg4//g' ${WRKSRC}/Makefile

.include <bsd.port.mk>
