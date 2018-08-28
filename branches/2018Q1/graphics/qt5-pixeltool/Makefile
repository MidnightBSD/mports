# $MidnightBSD$
# $FreeBSD: head/graphics/qt5-pixeltool/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=	pixeltool
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 screen magnifier

LICENSE=	gpl3

USE_QT5=	core gui widgets buildtools_build
QT_DIST=	tools
USES=		qmake

# qt5logo.png is installed by qt5-widgets.
DESKTOP_ENTRIES="Qt 5 PixelTool" "" \
		"${QT_PREFIX}/share/pixmaps/qt5logo.png" \
		"${PREFIX}/${QT_BINDIR_REL}/pixeltool" \
		"Graphics;Qt;" true

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

.include <bsd.port.mk>
