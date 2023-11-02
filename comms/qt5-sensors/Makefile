PORTNAME=	sensors
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	comms
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt sensors module

USES=		compiler:c++11-lang perl5 qmake:norecursive qt-dist:5,sensors
USE_PERL5=	build
USE_QT=		core declarative buildtools:build

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake


.include <bsd.port.mk>
