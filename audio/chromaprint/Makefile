# $MidnightBSD$
# $FreeBSD: head/audio/chromaprint/Makefile 461213 2018-02-08 11:28:36Z jhale $

PORTNAME=	chromaprint
PORTVERSION=	1.4.3
CATEGORIES=	audio
MASTER_SITES=	https://github.com/acoustid/${PORTNAME}/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AcoustID audio fingerprinting library

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libavcodec.so:multimedia/ffmpeg

USES=		cmake:outsource compiler:c++11-lib pathfix
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_TOOLS:BOOL=true \
		-DFFT_LIB:STRING=avfft

WRKSRC=		${WRKDIR}/${PORTNAME}-v${PORTVERSION}

OPTIONS_DEFINE=		DOXYGEN TEST

DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen \
			dot:graphics/graphviz
DOXYGEN_PORTDOCS=	*
DOXYGEN_IMPLIES=	DOCS

TEST_BUILD_DEPENDS=	${NONEXISTENT}:devel/googletest:patch
TEST_CMAKE_BOOL=	BUILD_TESTS
TEST_CMAKE_ON=		-DGTEST_ROOT:PATH=`${MAKE} -C ${PORTSDIR}/devel/googletest -VWRKSRC`
TEST_TARGET=		check

do-build-DOXYGEN-on:
	@(cd ${BUILD_WRKSRC}; ${DO_MAKE_BUILD} docs)

do-install-DOXYGEN-on:
	@${MKDIR} ${FAKE_DESTDIR}}${DOCSDIR}
	(cd ${INSTALL_WRKSRC}/doc; ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
