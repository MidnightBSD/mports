PORTNAME=	openjpeg
PORTVERSION=	1.5.2
PORTREVISION=	2
CATEGORIES=	graphics
PKGNAMESUFFIX=	15

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source JPEG 2000 codec
WWW=		https://www.openjpeg.org/

LICENSE=	bsd2

LIB_DEPENDS=	liblcms2.so:graphics/lcms2 \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff

OPTIONS_DEFINE=	DOCS

DOS2UNIX_FILES=	libopenjpeg/opj_malloc.h
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		cmake cpe dos2unix

PORTDOCS=	CHANGES LICENSE

PLIST_SUB=	PORTVERSION=${PORTVERSION} VER=${PORTVERSION:R}

GH_ACCOUNT=	uclouvain
GH_TAGNAME=	version.${PORTVERSION}
USE_GITHUB=	yes

CPE_VENDOR=	uclouvain

WRKSRC=		${WRKDIR}/openjpeg-version.1.5.2

.include <bsd.port.mk>
