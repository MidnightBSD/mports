PORTNAME=	babl
PORTVERSION=	0.1.74
CATEGORIES=	x11
MASTER_SITES=	GIMP

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dynamic pixel format conversion library

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	liblcms2.so:graphics/lcms2

USES=		compiler:c11 gnome libtool localbase meson pathfix pkgconfig tar:xz
USE_GCC=	7

USE_LDCONFIG=	yes
USE_GNOME=	introspection:build

OPTIONS_DEFINE=	SIMD
OPTIONS_DEFAULT=SIMD

SIMD_MESON_OFF=	-Denable-mmx=false -Denable-sse=false \
		-Denable-sse2=false -Denable-sse3=false \
		-Denable-sse4_1=false -Denable-avx2=false \
		-Denable-f16c=false

.include <bsd.port.mk>
