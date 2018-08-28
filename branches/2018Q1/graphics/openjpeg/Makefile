# $MidnightBSD$

PORTNAME=	openjpeg
PORTVERSION=	2.1.2
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source JPEG 2000 codec

LICENSE=	bsd2

LIB_DEPENDS=	liblcms2.so:${PORTSDIR}/graphics/lcms2 \
		libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff

USE_LDCONFIG=	yes
USES=		cmake cpe pkgconfig

PLIST_SUB=	VER=${PORTVERSION:R}

GH_ACCOUNT=	uclouvain
USE_GITHUB=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$${OPENJPEG_INSTALL_LIB_DIR}/pkgconfig|libdata/pkgconfig|' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
