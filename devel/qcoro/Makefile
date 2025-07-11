PORTNAME=	qcoro
DISTVERSIONPREFIX=	v
DISTVERSION=	0.11.0
CATEGORIES=	devel kde
PKGNAMESUFFIX=	-${FLAVOR}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Coroutines for Qt
WWW=		https://github.com/danvratil/qcoro

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSES/MIT.txt

FLAVORS=	qt5 qt6
FLAVOR?=	qt5

USES=		cmake:testing compiler:c++20-lang gl pkgconfig qt:${FLAVOR:S/qt//}
USE_GITHUB=	yes
GH_ACCOUNT=	danvratil
_USE_GL_qt5=	# empty
_USE_GL_qt6=	opengl
USE_GL=		${_USE_GL_${FLAVOR}}
_USE_QT_qt5=	core dbus declarative gui network websockets \
		buildtools:build concurrent:build qmake:build testlib:build
_USE_QT_qt6=	base declarative websockets
USE_QT=		${_USE_QT_${FLAVOR}}

CMAKE_ARGS=		-DUSE_QT_VERSION=${FLAVOR:S/qt//}
CMAKE_ON=		BUILD_SHARED_LIBS
CMAKE_OFF=		QCORO_BUILD_EXAMPLES \
			QCORO_BUILD_TESTING
CMAKE_TESTING_ON=	QCORO_BUILD_TESTING

PLIST_SUB=	QT_VER=${FLAVOR:S/qt//} \
		SHORTVER=${DISTVERSION:R:R} \
		FULLVER=${DISTVERSION}

.include <bsd.port.mk>
