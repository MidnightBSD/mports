# Created by: Ken Moore <ken@pcbsd.org>
# $FreeBSD: head/x11/lumina/Makefile 419929 2016-08-09 15:42:32Z kmoore $
# $MidnightBSD$

PORTNAME=	lumina
DISTVERSIONPREFIX=	v
DISTVERSION=	1.0.0-Release-p1
PORTEPOCH=	2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lumina Desktop Environment

LICENSE=	bsd3

RUN_DEPENDS=	fluxbox>=0:${PORTSDIR}/x11-wm/fluxbox \
		kde4-icons-oxygen>=0:${PORTSDIR}/x11-themes/kde4-icons-oxygen \
		xscreensaver:${PORTSDIR}/x11/xscreensaver \
		xbrightness:${PORTSDIR}/x11/xbrightness \
		xrandr:${PORTSDIR}/x11/xrandr \
		numlockx:${PORTSDIR}/x11/numlockx
LIB_DEPENDS=	libxcb-ewmh.so:${PORTSDIR}/x11/xcb-util-wm \
		libxcb-icccm.so:${PORTSDIR}/x11/xcb-util-wm \
		libxcb-image.so:${PORTSDIR}/x11/xcb-util-image \
		libxcb-util.so:${PORTSDIR}/x11/xcb-util

CONFLICTS=	lumina-devel-0*

OPTIONS_DEFINE=	MULTIMEDIA TRUEOS
OPTIONS_DEFAULT=	MULTIMEDIA
MULTIMEDIA_DESC=	Install multimedia support backend (gstreamer)
TRUEOS_DESC=	Use the TrueOS system interface settings.

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMULTIMEDIA}
RUN_DEPENDS+=	gstreamer1-plugins-core>=0:${PORTSDIR}/multimedia/gstreamer1-plugins-core
.endif

MAKE_JOBS_UNSAFE=yes

USE_GL=		gl
USE_XORG=	x11 xdamage xcb
USE_LDCONFIG=	yes
USE_QT5=	core gui widgets network svg multimedia imageformats \
		buildtools_build x11extras concurrent
USES=		desktop-file-utils qmake
USE_GITHUB=	yes
GH_ACCOUNT=	trueos

#Setup the qmake configuration options
.if ${PORT_OPTIONS:MTRUEOS}
QMAKE_ARGS=	DEFAULT_SETTINGS=TrueOS
.endif

.include <bsd.port.mk>
