PORTNAME=	networkauth
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	net
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt network auth module

USES=		compiler:c++11-lang perl5 qmake:no_env qt-dist:5
USE_PERL5=	extract
USE_QT=		core network \
		buildtools:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
