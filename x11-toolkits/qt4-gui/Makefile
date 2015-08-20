# $MidnightBSD$
# $FreeBSD: ports/x11-toolkits/qt4-gui/Makefile,v 1.35 2011/03/25 09:54:14 avilla Exp $

PORTNAME=	gui
DISTVERSION=	${QT4_VERSION}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt graphical user interface library

LICENSE=	gpl3

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png \
		libfontconfig.so:${PORTSDIR}/x11-fonts/fontconfig
RUN_DEPENDS=	xdg-open:${PORTSDIR}/devel/xdg-utils

USE_QT4=	qmake_build moc_build rcc_build uic_build corelib
QT_NONSTANDARD=	yes
QT_DIST=	yes

HAS_CONFIGURE=	yes
USES=		pkgconfig
USE_LDCONFIG=	${PREFIX}/lib/qt4
USE_XORG=	xrender xrandr xinerama inputproto xfixes \
		sm xcursor xext x11 ice xi xt

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib:$$LD_LIBRARY_PATH \
		PATH=${WRKSRC}/bin:$$PATH

DO_NOT_EXTRACT=	demos doc examples mkspecs qmake tools translations \
		src/activeqt src/dbus src/multimedia src/network src/opengl \
		src/openvg src/phonon src/qt3support src/s60installs \
		src/s60main src/script src/scripttools src/sql src/svg \
		src/testlib src/tools src/winmain src/xml src/xmlpatterns \
		src/3rdparty/clucene src/3rdparty/freetype \
		src/3rdparty/libjpeg src/3rdparty/libmng src/3rdparty/libpng \
		src/3rdparty/libtiff src/3rdparty/phonon src/3rdparty/webkit
.for dne in ${DO_NOT_EXTRACT}
EXTRACT_AFTER_ARGS+=	--exclude '${DISTNAME}/${dne}'
.endfor

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

CONFIGURE_ARGS+=	-I../../include/QtCore -I../../include/QtGui \
			-I../../include/Qt -I../../include

FONTSCALE=	${LOCALBASE}/share/fonts/TTF/luximb.ttf
FONTENCOD=	${LOCALBASE}/share/fonts/encodings/encodings.dir

.include "${.CURDIR}/../../devel/qt4/files/Makefile.options"

.if ${QT4_OPTIONS:MCUPS}
BUILD_DEPENDS+=	${LOCALBASE}/lib/libcups.a:${PORTSDIR}/print/cups-client
CONFIGURE_ARGS+=-cups -L${LOCALBASE}/lib -I. -I${LOCALBASE}/include
.endif

.if ${QT4_OPTIONS:MNAS}
LIB_DEPENDS+=	libaudio.so:${PORTSDIR}/audio/nas
CONFIGURE_ARGS+=-system-nas-sound
.else
CONFIGURE_ARGS+=-no-nas-sound
.endif

.if ${QT4_OPTIONS:MQGTKSTYLE}
USE_GNOME=	gtk20
CONFIGURE_ARGS+=-gtkstyle
.else
CONFIGURE_ARGS+=-no-gtkstyle
.endif

.if defined(PACKAGE_BUILDING)
RUN_DEPENDS+=	xorg-fonts-truetype>0:${PORTSDIR}/x11-fonts/xorg-fonts-truetype \
		${FONTENCOD}:${PORTSDIR}/x11-fonts/encodings
.endif

.include <bsd.port.pre.mk>

pre-configure:
	${MKDIR} ${WRKSRC}/mkspecs
	${LN} -sf ${LOCALBASE}/bin/qmake-qt4 ${WRKSRC}/bin/qmake
	${LN} -sf ${LOCALBASE}/bin/moc-qt4 ${WRKSRC}/bin/moc
	${LN} -sf ${LOCALBASE}/bin/rcc ${WRKSRC}/bin/rcc
	${LN} -sf ${LOCALBASE}/bin/uic-qt4 ${WRKSRC}/bin/uic

post-configure:
	${REINPLACE_CMD} -e 's|${PREFIX}/lib/qt4/pkgconfig|${PREFIX}/libdata/pkgconfig|g' \
		-e 's|.*$$(QMAKE).*||g' ${BUILD_WRKSRC}/Makefile
	${REINPLACE_CMD} -E -e 's|-L.[^[:space:]]*qt-x11-opensource.[^[:space:]]*lib||g' \
		-E -e 's|(.*location=).*moc|\1${PREFIX}/bin/moc-qt4|g' \
		-E -e 's|(.*location=).*uic|\1${PREFIX}/bin/uic-qt4|g' \
		${WRKSRC}/lib/pkgconfig/QtGui.pc

post-install:
	${INSTALL_DATA} ${BUILD_WRKSRC}/dialogs/images/qtlogo-64.png \
		${PREFIX}/share/pixmaps/qtlogo.png

.include <bsd.port.post.mk>
