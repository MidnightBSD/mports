PORTNAME=	libmysofa
DISTVERSION=	1.2.1-16
DISTVERSIONSUFFIX=	-g52590e1
DISTVERSIONPREFIX=	v
CATEGORIES=	audio

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SOFA (Spatially Oriented Format for Acoustics) file reader
WWW=		https://github.com/hoene/libmysofa

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_TEST=	yes

USES=		cmake cpe
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	hoene

CPE_VENDOR=	symonics

# The tests are expected to be in ../tests relative to the build
# directory and the build results are expected to be in build/ relative
# to ${WRKSRC}.  USES=cmake does not allow overwriting ${WRKDIR}/.build
# as the build directory.
post-patch:
	@${RLN} ${WRKSRC}/build ${CONFIGURE_WRKSRC}

.include <bsd.port.mk>
