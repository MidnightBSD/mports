PORTNAME=	x11extras
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	x11
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt platform-specific features for X11-based systems

USES=		compiler:c++11-lang perl5 qmake qt-dist:5,x11extras perl5
USE_PERL5=	extract
USE_QT=		core gui \
		buildtools:build # syncqt

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5X11Extras/Qt5X11ExtrasConfig.cmake

.include <bsd.port.mk>
