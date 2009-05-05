# $MidnightBSD: mports/x11/xorg-cf-files/Makefile,v 1.3 2009/01/01 20:25:27 ctriv Exp $

PORTNAME=	xorg-cf-files
PORTVERSION=	1.0.2
PORTREVISION=	3
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org cf files for use with imake builds
LICENSE=	unknown

XORG_CAT=	util

post-patch:
		@${REINPLACE_CMD} 's|\(define ExtraXaw[^ ]*\) [$$].*|\1 /**/|' \
			${WRKSRC}/X11.tmpl

.include <bsd.port.mk>
