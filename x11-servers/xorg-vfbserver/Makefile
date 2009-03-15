# $MidnightBSD: mports/x11-servers/xorg-vfbserver/Makefile,v 1.4 2008/08/20 18:50:20 laffer1 Exp $

PORTNAME=	xorg-vfbserver
PORTVERSION=	1.5.3
PORTEPOCH=	1
CATEGORIES=	x11-servers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X virtual framebuffer server from X.Org
LICENSE=	x11

XORG_CAT=	xserver

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm
USE_GL=		gl
USE_XORG=	x11 xf86driproto glproto randrproto renderproto fixesproto \
		damageproto xcmiscproto xextproto xf86miscproto inputproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		dri2proto resourceproto fontsproto xf86dgaproto videoproto \
		compositeproto trapproto recordproto resourceproto \
		xineramaproto evieproto xkbfile xfont fontenc xkbui xxf86misc \
		xxf86vm xaw7 xmu xpm xext pixman xtrans

CONFIGURE_ARGS=	--disable-dmx --disable-xnest --disable-xorg --disable-xprint \
		--localstatedir=/var --without-dtrace

PLIST_FILES=	bin/Xvfb
MAN1=		Xvfb.1

do-install:
	cd ${WRKSRC}/hw/vfb; ${MAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.mk>
