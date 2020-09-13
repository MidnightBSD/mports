PORTNAME=	libXaw
PORTVERSION=	1.0.13
PORTREVISION=	1
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake xorg xorg-cat:lib
USE_XORG=	x11 xau xext xmu xpm xorgproto xt
CONFIGURE_ARGS+=--without-xmlto

.include <bsd.port.mk>
