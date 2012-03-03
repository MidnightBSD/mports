# $MidnightBSD: mports/x11/xrx/Makefile,v 1.5 2011/05/07 20:36:44 laffer1 Exp $

PORTNAME=	xrx
PORTVERSION=	1.0.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RX helper program
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xt xext xtrans xproxymngproto xau xaw ice
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool

MAN1=		xrx.1 libxrx.1

post-patch:
	@${REINPLACE_CMD} -e 's|mozilla-plugin|disabled-libxul-plugin|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
