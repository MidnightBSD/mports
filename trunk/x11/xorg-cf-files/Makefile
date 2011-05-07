# $MidnightBSD: mports/x11/xorg-cf-files/Makefile,v 1.5 2009/05/31 18:31:14 laffer1 Exp $

PORTNAME=	xorg-cf-files
PORTVERSION=	1.0.3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cf files for use with imake builds
LICENSE=	x11

XORG_CAT=	util

post-patch:
		@${REINPLACE_CMD} 's|\(define ExtraXaw[^ ]*\) [$$].*|\1 /**/|' \
			${WRKSRC}/X11.tmpl

.include <bsd.port.mk>
