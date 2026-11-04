PORTNAME=	libsamplerate
DISTVERSION=	0.2.2
CATEGORIES=	audio
MASTER_SITES=	https://github.com/libsndfile/${PORTNAME}/releases/download/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secret Rabbit Code: a Sample Rate Converter for audio
WWW=		http://www.mega-nerd.com/SRC/

# Upstream relicensed from GPLv2 to BSD 2-clause in 0.2.0.
LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cmake cpe pkgconfig tar:xz

CPE_VENDOR=	${CPE_PRODUCT}_project

USE_LDCONFIG=	yes

TEST_TARGET=	test

CMAKE_ON=	BUILD_SHARED_LIBS LIBSAMPLERATE_INSTALL

OPTIONS_DEFINE=	DOCS EXAMPLES TEST

EXAMPLES_LIB_DEPENDS=		libsndfile.so:audio/libsndfile
EXAMPLES_CMAKE_BOOL=		LIBSAMPLERATE_EXAMPLES

TEST_LIB_DEPENDS=		libfftw3.so:math/fftw3 \
				libsndfile.so:audio/libsndfile
TEST_CMAKE_BOOL=		BUILD_TESTING

# Option helper targets run in the main make, where PREFIX is not
# stage-prefixed and STAGEDIR is empty, so FAKE_DESTDIR has to be explicit.
do-install-EXAMPLES-on:
	${INSTALL_PROGRAM} ${WRKDIR}/.build/examples/timewarp-file \
		${FAKE_DESTDIR}${PREFIX}/bin/
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/bin/timewarp-file

.include <bsd.port.mk>
