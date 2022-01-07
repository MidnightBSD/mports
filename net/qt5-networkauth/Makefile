PORTNAME=	networkauth
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	net
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt network auth module

USES=		compiler:c++11-lang qmake:no_env qt-dist:5
USE_QT=		core network \
		buildtools_build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
