# $MidnightBSD$

PORTNAME=	libXaw
PORTVERSION=	1.0.13
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

XORG_CAT=	lib
USE_XORG=	x11 xau xext xmu xp xpm xorgproto xt
USES=		gmake
CONFIGURE_ARGS+=--without-xmlto

.include <bsd.port.mk>
