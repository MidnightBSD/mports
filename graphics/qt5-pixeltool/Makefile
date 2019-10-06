PORTNAME=	pixeltool
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 screen magnifier

LICENSE=	lgpl3

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core gui widgets buildtools_build

# qt5logo.png is installed by qt5-widgets.
DESKTOP_ENTRIES="Qt 5 PixelTool" "" \
		"${PREFIX}/share/pixmaps/qt5logo.png" \
		"${PREFIX}/${QT_BINDIR_REL}/pixeltool" \
		"Graphics;Qt;" true

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

.include <bsd.port.mk>
