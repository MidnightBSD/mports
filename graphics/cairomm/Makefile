PORTNAME=	cairomm
DISTVERSION=	1.14.5
CATEGORIES=	graphics
MASTER_SITES=	http://cairographics.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ interface to cairo
WWW=		https://cairographics.org

LICENSE=	lgpl

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libpng.so:graphics/png

USES=		compiler:c++11-lang gnome meson pkgconfig tar:xz
USE_GNOME=	cairo libsigc++20
USE_XORG=	x11 xext xrender
USE_LDCONFIG=	yes

MESON_ARGS=	-Dbuild-examples=false \
		-Dbuild-tests=false

.include <bsd.port.mk>
