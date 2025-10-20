PORTNAME=	libtorrent-rasterbar
DISTVERSIONPREFIX=	v
DISTVERSION=	2.0.11
PORTREVISION=	2
CATEGORIES=	net-p2p
#MASTER_SITES=	https://github.com/arvidn/libtorrent/releases/download/v${DISTVERSION}/
PKGNAMESUFFIX=	2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ library implementing a BitTorrent client
WWW=		https://libtorrent.org \
		https://github.com/arvidn/libtorrent

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libboost_chrono.so:devel/boost-libs \
		libboost_random.so:devel/boost-libs \
		libboost_system.so:devel/boost-libs

USES=		cmake:testing compiler:c++11-lib iconv:wchar_t \
		localbase:ldflags pathfix pkgconfig python:test shebangfix ssl
USE_LDCONFIG=	yes

SHEBANG_GLOB=	*.py

USE_GITHUB=	yes
GH_ACCOUNT=	arvidn
GH_PROJECT=	libtorrent
GH_TUPLE=	arvidn:try_signal:105cce5:try_signal/deps/try_signal \
		arvidn:libsimulator:66ac6cc:libsimulator/simulation/libsimulator \
		paullouisageneau:boost-asio-gnutls:a57d4d3:asio/deps/asio-gnutls

USE_CXXSTD=	c++17 # prevent boost-related SEGV, see bug#264278

LDFLAGS+=	${ICONV_LIB}

DOCFILES=	AUTHORS ChangeLog
PORTDOCS=	${DOCFILES} docs/*
PORTEXAMPLES=	*.cpp

CMAKE_TESTING_ON=	build_tests

OPTIONS_DEFINE=		DOCS EXAMPLES LOGGING
OPTIONS_DEFAULT=	LOGGING
OPTIONS_SUB=		yes
LOGGING_DESC=		Enable logging to disk

EXAMPLES_CMAKE_BOOL=	build_examples
LOGGING_CMAKE_BOOL=	logging

CONFLICTS_INSTALL=	libtorrent-rasterbar

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|"python3"|"${PYTHON_CMD:T}"|' \
		${WRKSRC}/test/setup_transfer.cpp

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCFILES:S|^|${WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} docs ${FAKE_DESTDIR}${DOCSDIR}
	${RM} ${FAKE_DESTDIR}${DOCSDIR}/docs/._*

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/${PORTEXAMPLES} \
		${FAKE_DESTDIR}${EXAMPLESDIR}

# tests as of 2.0.11: 99% tests passed, 1 tests failed out of 106, see https://github.com/arvidn/libtorrent/issues/7837

.include <bsd.port.mk>
