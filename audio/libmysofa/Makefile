PORTNAME=	libmysofa
DISTVERSION=	1.3.3
DISTVERSIONPREFIX=	v
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SOFA (Spatially Oriented Format for Acoustics) file reader
WWW=		https://github.com/hoene/libmysofa

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	cunit>0:devel/cunit

NO_TEST=	yes

USES=		cmake cpe
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	hoene

CPE_VENDOR=	symonics

OPTIONS_DEFINE=		STATIC
OPTIONS_DEFAULT=	STATIC
OPTIONS_SUB=		yes

STATIC_CMAKE_BOOL=	BUILD_STATIC_LIBS

# The tests are expected to be in ../tests relative to the build
# directory and the build results are expected to be in build/ relative
# to ${WRKSRC}.  USES=cmake does not allow overwriting ${WRKDIR}/.build
# as the build directory.
post-patch:
	@${RLN} ${WRKSRC}/build ${CONFIGURE_WRKSRC}

.include <bsd.port.mk>
