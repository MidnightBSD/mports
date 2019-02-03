# $MidnightBSD$

PORTNAME=	libXaw
PORTVERSION=	1.0.13
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	lib
USE_XORG=	printproto:both x11 xau xext xextproto xmu xp xpm xproto:both xt
USES=		gmake
CONFIGURE_ARGS+=--without-xmlto

.include <bsd.port.mk>
