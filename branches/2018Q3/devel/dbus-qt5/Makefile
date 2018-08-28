# $MidnightBSD$
# $FreeBSD: head/devel/dbus-qt5/Makefile 412346 2016-04-01 14:00:51Z mat $

PORTNAME=	dbus
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt D-Bus inter-process communication module

LICENSE=	gpl3

LIB_DEPENDS=	libdbus-1.so:devel/dbus

USE_QT5=	core qmake_build buildtools_build
QT_DIST=	base
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-no-gui -no-xcb
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

TOOLS=		qdbuscpp2xml qdbusxml2cpp

QT_DEFINES=	DBUS
QT_CONFIG=	dbus

post-configure:
.for t in ${TOOLS}
	@cd ${WRKSRC}/src/tools/${t} && \
		${SETENV} ${QMAKE_ENV} ${WRKSRC}/bin/qmake ${QMAKE_ARGS}
.endfor

post-build:
.for t in ${TOOLS}
	@cd ${WRKSRC}/src/tools/${t} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET}
.endfor

post-install:
.for t in ${TOOLS}
	@cd ${WRKSRC}/src/tools/${t} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endfor

.include <bsd.port.mk>
