# $MidnightBSD$
# $FreeBSD: head/devel/qt5-core/Makefile 418153 2016-07-06 22:10:14Z mat $

PORTNAME=	core
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	0
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt core non-graphical module

LICENSE=	gpl3

LIB_DEPENDS=	libicui18n.so:${PORTSDIR}/devel/icu \
		libpcre.so:${PORTSDIR}/devel/pcre

USES=		execinfo
USE_GNOME=	glib20
USE_QT5=	qmake_build buildtools_build
QT_DIST=	base
HAS_CONFIGURE=	yes
# Disable (almost) everything to install minimal qconfig.h.
# -no-feature-* adds QT_NO_* (for features which have no switch or
# that need to be detected).
CONFIGURE_ARGS=	-no-accessibility -no-gif -no-libpng -no-libjpeg \
		-no-openssl -no-gui -no-widgets -no-cups \
		-no-iconv -no-dbus -no-xcb -no-opengl \
		-no-alsa -no-egl -no-evdev -no-feature-concurrent \
		-no-fontconfig -no-freetype -no-gtkstyle -no-harfbuzz \
		-no-libudev -no-pulseaudio -no-xcb -no-xinput -no-xkb \
		-no-xkbcommon -no-xrender -no-xshape -no-xsync -no-xvideo
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/corelib
INSTALL_WRKSRC=	${BUILD_WRKSRC}

QT_DEFINES=	GLIB
QT_CONFIG=	glib icu

.include <bsd.port.pre.mk>

post-install:
# Allow qconfig.h to be customized by single ports.
	${REINPLACE_CMD} -i "" '1 s|.*|#include <QtCore/qconfig-modules.h>|' \
		${STAGEDIR}${PREFIX}/${QT_INCDIR_REL}/QtCore/qconfig.h
	${CP} ${PREFIX}/lib/pkgconfig/Qt5Core.pc ${PREFIX}/libdata/pkgconfig/Qt5Core.pc

.include <bsd.port.post.mk>
