PORTNAME=	uitools
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	2
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt Designer UI forms support module

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core gui uiplugin widgets buildtools_build

BUILD_WRKSRC=	${WRKSRC}/src/designer/src/${PORTNAME}
INSTALL_WRKSRC=	${WRKSRC}/src/designer/src/${PORTNAME}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5UiTools/Qt5UiToolsConfig.cmake

.include <bsd.port.mk>
