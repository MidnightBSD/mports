# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/qt5-widgets/Makefile 416056 2016-05-28 17:27:21Z pi $

PORTNAME=	widgets
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt C++ widgets module

LICENSE=	gpl3

USE_QT5=	core gui qmake_build buildtools_build
QT_DIST=	base
USE_XORG=	x11
HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

MORE_WRKSRCS=	src/tools/uic \
		src/plugins/platformthemes

QT_DEFINES=	ACCESSIBILITY WIDGETS XSYNC
QT_CONFIG=	accessibility accessibility-atspi-bridge xlib

OPTIONS_DEFINE=	GTK2
OPTIONS_SUB=	yes

GTK2_DESC=	GTK+-based Qt theme
GTK2_USE=	GNOME=gtk20
GTK2_CONFIGURE_ON=	-gtkstyle
GTK2_CONFIGURE_OFF=	-no-gtkstyle

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGTK2}
QT_DEFINES+=	STYLE_GTK
QT_CONFIG+=	gtkstyle
.else
QT_DEFINES+=	-STYLE_GTK
QT_CONFIG+=	-gtkstyle
.endif

# libQt5PlatformSupport.a is installed by qt5-core but needed for the gtk style plugin
post-configure:
	${LN} -s ${QT_LIBDIR}/libQt5PlatformSupport.a \
		${WRKSRC}/lib/libQt5PlatformSupport.a

pre-build:
	@cd ${WRKSRC}/src/tools/uic && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET}

post-install:
.for d in ${MORE_WRKSRCS}
	@cd ${WRKSRC}/${d} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endfor
	${INSTALL_DATA} ${BUILD_WRKSRC}/dialogs/images/qtlogo-64.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/qt5logo.png

.include <bsd.port.mk>
