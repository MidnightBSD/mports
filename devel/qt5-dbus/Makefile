PORTNAME=	dbus
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt D-Bus inter-process communication module

LIB_DEPENDS=	libdbus-1.so:devel/dbus

USES=		compiler:c++11-lang qmake:no_env qt-dist:5,base
USE_QT=		core qmake_build buildtools_build
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-no-gui -no-xcb
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

TOOLS=		qdbuscpp2xml qdbusxml2cpp

QT_DEFINES=	DBUS
QT_CONFIG=	dbus

post-configure:
.for d in src/dbus src/tools/qdbuscpp2xml src/tools/qdbusxml2cpp
	${MKDIR} ${WRKSRC}/${d}
	cd ${WRKSRC}/${d} && ${SETENV} ${QMAKE_ENV} ${_QMAKE} ${QMAKE_ARGS} ${WRKSRC}/${d}
.endfor

post-build:
.for t in ${TOOLS}
	@cd ${WRKSRC}/src/tools/${t} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET}
.endfor

post-install:
.for t in ${TOOLS}
	@cd ${WRKSRC}/src/tools/${t} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${FAKE_MAKEFLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endfor
	${REINPLACE_CMD} 's|/usr/include/qt5|/usr/local/include/qt5|g' \
		${PREFIX}/lib/cmake/Qt5DBus/Qt5DBusConfig.cmake

.include <bsd.port.mk>
