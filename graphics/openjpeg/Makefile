PORTNAME=	openjpeg
PORTVERSION=	2.5.3
DISTVERSIONPREFIX=	v
CATEGORIES=	graphics

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Open-source JPEG 2000 codec
WWW=		https://www.openjpeg.org/ \
		https://github.com/uclouvain/openjpeg

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	liblcms2.so:graphics/lcms2 \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff

USES=		cmake cpe localbase:ldflags jpeg pathfix pkgconfig

CMAKE_OFF=	BUILD_DOC \
		BUILD_JAVA \
		BUILD_JPIP \
		BUILD_JPIP_SERVER \
		BUILD_LUTS_GENERATOR \
		BUILD_TESTING \
		BUILD_THIRDPARTY \
		BUILD_UNIT_TESTS \
		BUILD_VIEWER \
		WITH_ASTYLE
CMAKE_ON=	BUILD_CODEC \
		BUILD_SHARED_LIBS \
		BUILD_STATIC_LIBS
USE_LDCONFIG=	yes

PLIST_SUB=	PORTVERSION=${PORTVERSION} VER=${PORTVERSION:R}

GH_ACCOUNT=	uclouvain
USE_GITHUB=	yes

CPE_VENDOR=	uclouvain

# Clean up bundled libraries
.if !defined(MAINTAINER_MODE)
EXTRACT_AFTER_ARGS=	--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/astyle \
			--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/include \
			--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/liblcms2 \
			--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/libpng \
			--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/libtiff \
			--exclude ${GH_PROJECT_DEFAULT}-${GH_TAGNAME_EXTRACT}/thirdparty/libz \
			--no-same-owner --no-same-permissions
.else
post-patch:
	@${RM} -r ${WRKSRC}/thirdparty/astyle/
	@${RM} -r ${WRKSRC}/thirdparty/include/
	@${RM} -r ${WRKSRC}/thirdparty/liblcms2/
	@${RM} -r ${WRKSRC}/thirdparty/libpng/
	@${RM} -r ${WRKSRC}/thirdparty/libtiff/
	@${RM} -r ${WRKSRC}/thirdparty/libz/
.endif

.include <bsd.port.mk>
