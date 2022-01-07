PORTNAME=	svg
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SVG support module

USES=		compiler:c++11-lang qmake qt-dist:5,svg
USE_QT=		core gui widgets buildtools_build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake


.include <bsd.port.mk>
