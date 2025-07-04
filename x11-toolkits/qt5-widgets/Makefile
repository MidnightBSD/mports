PORTNAME=	widgets
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt C++ widgets module

USES=		compiler:c++11-lang perl5 qmake:no_env qt-dist:5,base xorg
USE_PERL5=	extract
USE_QT=		core gui qmake:build buildtools:build
USE_XORG=	x11
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}
HAS_CONFIGURE=	yes

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

MORE_WRKSRCS=	src/tools/uic

QT_BINARIES=	yes
QT_DEFINES=	ACCESSIBILITY WIDGETS XSYNC
QT_CONFIG=	accessibility accessibility-atspi-bridge xlib

OPTIONS_DEFINE=	GTK3
OPTIONS_SUB=	YES

GTK3_DESC=	GTK-based Qt theme
GTK3_USES=	gnome
GTK3_USE=	GNOME=gtk30 QT=dbus
GTK3_CONFIGURE_ON=	-gtk
GTK3_CONFIGURE_OFF=	-no-gtk

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MGTK3}
QT_DEFINES+=	STYLE_GTK
QT_CONFIG+=	gtk
MORE_WRKSRCS+=	src/plugins/platformthemes
.else
QT_DEFINES+=	-STYLE_GTK
QT_CONFIG+=	-gtk
.endif

post-configure:
.for d in src/tools/uic src/widgets ${MORE_WRKSRCS}
	${MKDIR} ${WRKSRC}/${d}
	cd ${WRKSRC}/${d} && ${SETENV} ${QMAKE_ENV} ${_QMAKE} ${QMAKE_ARGS} ${WRKSRC}/${d}
.endfor

pre-build:
	cd ${WRKSRC}/src/tools/uic && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET}

post-build:
.for d in ${MORE_WRKSRCS}
	@cd ${WRKSRC}/${d} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET}
.endfor

post-install:
.for d in src/tools/uic ${MORE_WRKSRCS}
	@cd ${WRKSRC}/${d} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${FAKE_MAKEFLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endfor
	${INSTALL_DATA} ${BUILD_WRKSRC}/dialogs/images/qtlogo-64.png \
		${STAGEDIR}${PREFIX}/share/pixmaps/qt5logo.png
	${RLN} ${STAGEDIR}${QT_BINDIR}/uic ${STAGEDIR}${PREFIX}/bin/uic-qt5

.include <bsd.port.mk>
