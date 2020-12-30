PORTNAME=	sensors
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	comms
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt sensors module

USES=		compiler:c++11-lang qmake:norecursive qt-dist:5,sensors
USE_QT=		core declarative buildtools_build

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
