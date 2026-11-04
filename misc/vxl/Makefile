PORTNAME=	vxl
DISTVERSIONPREFIX=	v
DISTVERSION=	3.3.2
CATEGORIES=	misc science

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ libraries for computer vision and image understanding
WWW=		https://vxl.github.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/core/vxl_copyright.h

LIB_DEPENDS=	libgeotiff.so:graphics/libgeotiff \
		libpng.so:graphics/png \
		libtiff.so:graphics/tiff

USES=		cmake compiler:c++11-lang jpeg
USE_GITHUB=	yes
USE_LDCONFIG=	yes

CONFLICTS_BUILD=	openjpeg15

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_OFF=	BUILD_TESTING

NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
PLIST_SUB+=	X86=""
CMAKE_ON+=	VIL_CONFIG_ENABLE_SSE2_ROUNDING
.elif ${ARCH} == "i386"
CFLAGS+=	-msse2
CXXFLAGS+=	-msse2
PLIST_SUB+=	X86=""
CMAKE_ON+=	VIL_CONFIG_ENABLE_SSE2_ROUNDING
.else
PLIST_SUB+=	X86="@comment "
CMAKE_OFF+=	VIL_CONFIG_ENABLE_SSE2_ROUNDING
.endif

.include <bsd.port.post.mk>
