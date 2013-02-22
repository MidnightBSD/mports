# $MidnightBSD: mports/x11/xrx/Makefile,v 1.6 2012/03/03 01:52:56 laffer1 Exp $

PORTNAME=	xrx
PORTVERSION=	1.0.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RX helper program
LICENSE=	mit

XORG_CAT=	app
USE_XORG=	x11 xt xext xtrans xproxymngproto xau xaw ice
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool

MAN1=		xrx.1 libxrx.1

post-patch:
	@${REINPLACE_CMD} -e 's|mozilla-plugin|disabled-libxul-plugin|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
