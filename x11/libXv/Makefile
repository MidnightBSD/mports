PORTNAME=	libXv
PORTVERSION=	1.0.12
PORTEPOCH=	1
CATEGORIES=	x11
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X Video Extension library
WWW=		https://www.freedesktop.org/wiki/Software/xlibs/

LICENSE=	mit

USE_XORG=	x11 xext xorgproto
USES=		cpe xorg xorg-cat:lib tar:xz
CPE_PRODUCT=	libxv
CPE_VENDOR=	x

CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

.include <bsd.port.mk>
