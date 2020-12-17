PORTNAME=	location
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt location module

USES=		compiler:c++11-lang qmake:norecursive qt-dist:5,location
USE_QT=		concurrent core dbus declarative gui network serialport \
		buildtools_build

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
                ${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
