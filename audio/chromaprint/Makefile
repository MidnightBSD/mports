PORTNAME=	chromaprint
DISTVERSION=	1.5.1.20221217
PORTREVISION=	2
CATEGORIES=	audio
#MASTER_SITES=	https://github.com/acoustid/${PORTNAME}/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AcoustID audio fingerprinting library
WWW=		https://acoustid.org/chromaprint

LICENSE=	lgpl2.1 mit
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libavcodec.so:multimedia/ffmpeg

USES=		cmake compiler:c++11-lib pathfix
USE_GITHUB=	yes
GH_ACCOUNT=	acoustid
GH_TAGNAME=	aa67c95
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_TOOLS:BOOL=true \
		-DAUDIO_PROCESSOR_LIB=swresample \
		-DFFT_LIB:STRING=avfft

OPTIONS_DEFINE=		DOCS DOXYGEN

DOXYGEN_BUILD_DEPENDS=	doxygen:devel/doxygen \
			dot:graphics/graphviz
DOXYGEN_PORTDOCS=	*
DOXYGEN_IMPLIES=	DOCS

NO_TEST=	yes

do-build-DOXYGEN-on:
	@(cd ${BUILD_WRKSRC}; ${DO_MAKE_BUILD} docs)

do-install-DOXYGEN-on:
	@${MKDIR} ${FAKE_DESTDIR}}${DOCSDIR}
	(cd ${INSTALL_WRKSRC}/doc; ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
