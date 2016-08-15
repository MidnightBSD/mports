# $MidnightBSD$

PORTNAME=	openjpeg
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES=	graphics
PKGNAMESUFFIX=	15

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open-source JPEG 2000 codec

LICENSE=	bsd2

LIB_DEPENDS=	liblcms2.so:${PORTSDIR}/graphics/lcms2 \
		libpng.so:${PORTSDIR}/graphics/png \
		libtiff.so:${PORTSDIR}/graphics/tiff

OPTIONS_DEFINE=	DOCS

DOS2UNIX_FILES=	libopenjpeg/opj_malloc.h
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		cmake cpe dos2unix

PORTDOCS=	CHANGES LICENSE

GH_ACCOUNT=	uclouvain
GH_TAGNAME=	version.${PORTVERSION}
USE_GITHUB=	yes

WRKSRC=		${WRKDIR}/openjpeg-version.1.5.2

.include <bsd.port.mk>
