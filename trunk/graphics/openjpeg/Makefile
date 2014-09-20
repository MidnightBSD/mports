# $MidnightBSD$

PORTNAME=	openjpeg
PORTVERSION=	2.1.0
CATEGORIES=	graphics
MASTER_SITES=	SF/openjpeg.mirror/${PORTVERSION}/
#??

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source JPEG 2000 codec

LICENSE=	bsd2

LIB_DEPENDS=	libtiff.so:${PORTSDIR}/graphics/tiff \
		libpng15.so:${PORTSDIR}/graphics/png \
		liblcms2.so:${PORTSDIR}/graphics/lcms2

USES=		cmake cpe pkgconfig
USE_LDCONFIG=	yes

PLIST_SUB=	VER=${PORTVERSION:R}

.include <bsd.port.mk>
