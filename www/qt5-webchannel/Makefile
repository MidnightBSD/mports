PORTNAME=	webchannel
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	www
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 5 library for integration of C++/QML with HTML/js clients

USES=		compiler:c++11-lang perl5 qmake:norecursive qt-dist:5,webchannel
USE_PERL5=	build
USE_QT=		core declarative \
		buildtools:build declarative-test:build testlib:build
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

# The default EXTRACT_AFTER_ARGS value excludes examples/ from the extracted
# tarball, which we need during the build.
EXTRACT_AFTER_ARGS=	--no-same-owner --no-same-permissions

post-install:
	${REINPLACE_CMD} 's|/../../../../|/../../../|g' \
		${PREFIX}/lib/cmake/Qt5*/Qt5*Config.cmake

.include <bsd.port.mk>
