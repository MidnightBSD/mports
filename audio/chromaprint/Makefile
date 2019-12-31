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

USES=		cmake compiler:c++11-lib pathfix
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_TOOLS:BOOL=true \
		-DFFT_LIB:STRING=avfft

WRKSRC=		${WRKDIR}/${PORTNAME}-v${PORTVERSION}

OPTIONS_DEFINE=		DOXYGEN

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
