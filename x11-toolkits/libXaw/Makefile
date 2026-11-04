PORTNAME=	libXaw
PORTVERSION=	1.0.16
CATEGORIES=	x11-toolkits
DISTFILES=	${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Athena Widgets library
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gmake xorg xorg-cat:lib tar:xz
USE_XORG=	x11 xau xext xmu xpm xorgproto xt
CONFIGURE_ARGS+=	--without-xmlto

.include <bsd.port.mk>
