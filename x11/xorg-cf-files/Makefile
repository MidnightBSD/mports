# $MidnightBSD: mports/x11/xorg-cf-files/Makefile,v 1.6 2011/05/07 16:17:51 laffer1 Exp $

PORTNAME=	xorg-cf-files
PORTVERSION=	1.0.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cf files for use with imake builds
LICENSE=	mit

XORG_CAT=	util

post-patch:
		@${REINPLACE_CMD} 's|\(define ExtraXaw[^ ]*\) [$$].*|\1 /**/|' \
			${WRKSRC}/X11.tmpl

.include <bsd.port.mk>
