PORTNAME=	svg
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	graphics
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt SVG support module

USES=		compiler:c++11-lang perl5 qmake qt-dist:5,svg
USE_PERL5=	build
USE_QT=		core gui widgets buildtools:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake


.include <bsd.port.mk>
