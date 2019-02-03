# $MidnightBSD$

PORTNAME=	openjpeg
PORTVERSION=	2.3.0
PORTREVISION=	2
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source JPEG 2000 codec

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	cmake>=3:devel/cmake
LIB_DEPENDS=	liblcms2.so:graphics/lcms2 \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff

USE_LDCONFIG=	yes
USES=		cmake cpe pkgconfig

PLIST_SUB=	PORTVERSION=${PORTVERSION} VER=${PORTVERSION:R}

GH_ACCOUNT=	uclouvain
USE_GITHUB=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${OPENJPEG_INSTALL_LIB_DIR}/pkgconfig|libdata/pkgconfig|' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
