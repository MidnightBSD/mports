# $MidnightBSD: mports/x11-toolkits/libXaw/Makefile,v 1.6 2013/02/22 03:09:31 laffer1 Exp $

PORTNAME=	libXaw
PORTVERSION=	1.0.11
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library
LICENSE=	mit

XORG_CAT=	lib
USE_XORG=	printproto:both x11 xau xext xextproto xmu xp xpm xproto:both xt
USE_GMAKE=	yes
CONFIGURE_ARGS+=--without-xmlto

MAN3=		Xaw.3

.include <bsd.port.mk>
