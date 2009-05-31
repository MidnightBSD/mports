# $MidnightBSD: mports/x11/xorg-cf-files/Makefile,v 1.4 2009/05/05 01:24:44 laffer1 Exp $

PORTNAME=	xorg-cf-files
PORTVERSION=	1.0.2
PORTREVISION=	4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cf files for use with imake builds
LICENSE=	unknown

XORG_CAT=	util

post-patch:
		@${REINPLACE_CMD} 's|\(define ExtraXaw[^ ]*\) [$$].*|\1 /**/|' \
			${WRKSRC}/X11.tmpl

.include <bsd.port.mk>
