PORTNAME=	kddockwidgets
DISTVERSIONPREFIX=	v
DISTVERSION=	2.4.0
CATEGORIES=	x11-toolkits

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDAB's Dock Widget Framework for Qt
WWW=		https://www.kdab.com/development-resources/qt-tools/kddockwidgets/

LICENSE=	gpl2+

BUILD_DEPENDS=	nlohmann-json>0:devel/nlohmann-json
LIB_DEPENDS=	libfmt.so:devel/libfmt \
		libspdlog.so:devel/spdlog

USES=		cmake:testing compiler:c++17-lang qt:6
USE_QT=		base declarative
USE_LDCONFIG=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	KDAB
GH_PROJECT=	KDDockWidgets

CMAKE_ON=		KDDockWidgets_QT6
CMAKE_TESTING_ON=	KDDockWidgets_TESTS KDDockWidgets_DEVELOPER_MODE

PLIST_SUB=	SHLIB_VER=${PORTVERSION}

post-install:
	@${RM} -r ${FAKE_DESTDIR}${TRUE_PREFIX}/share/doc

.include <bsd.port.mk>
