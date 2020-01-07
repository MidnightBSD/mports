PORTNAME=	leptonica
PORTVERSION=	1.76.0
PORTREVISION=	1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C library for efficient image processing and image analysis operations

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/leptonica-license.txt

CONFLICTS=	leptonlib-[0-9]*

USES=		autoreconf libtool localbase:ldflags pathfix pkgconfig

USE_GITHUB=	yes
GH_ACCOUNT=	DanBloomberg

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		BIN GIF JPEG JPEG2000 PNG TIFF WEBP ZLIB
OPTIONS_DEFAULT=	BIN GIF JPEG PNG TIFF WEBP ZLIB
OPTIONS_SUB=		yes

BIN_DESC=		Build additional programs
BIN_CONFIGURE_ENABLE=	programs
GIF_LIB_DEPENDS=	libgif.so:graphics/giflib
GIF_CONFIGURE_WITH=	giflib
JPEG_USES=		jpeg
JPEG_CONFIGURE_WITH=	jpeg
JPEG2000_LIB_DEPENDS=	libopenjp2.so:graphics/openjpeg
JPEG2000_CONFIGURE_WITH=libopenjpeg
PNG_LIB_DEPENDS=	libpng.so:graphics/png
PNG_CONFIGURE_WITH=	libpng
TIFF_LIB_DEPENDS=	libtiff.so:graphics/tiff
TIFF_CONFIGURE_WITH=	libtiff
WEBP_LIB_DEPENDS=	libwebp.so:graphics/webp
WEBP_CONFIGURE_WITH=	libwebp
ZLIB_CONFIGURE_WITH=	zlib

NO_TEST=	yes

BUILD_DEPENDS+=	${LOCALBASE}/bin/gnuplot:math/gnuplot

.include <bsd.port.mk>
