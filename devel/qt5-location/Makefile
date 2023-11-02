PORTNAME=	location
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt location module

USES=		compiler:c++11-lang perl5 qmake:norecursive qt-dist:5,location
USE_PERL5=	build
USE_QT=		concurrent core dbus declarative gui network serialport \
		buildtools:build

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
                ${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
