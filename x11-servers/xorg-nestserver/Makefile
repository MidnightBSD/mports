# $MidnightBSD: mports/x11-servers/xorg-nestserver/Makefile,v 1.4 2007/10/17 03:45:09 ctriv Exp $

PORTNAME=	xorg-nestserver
PORTVERSION=	1.5.3
PORTEPOCH=	1
CATEGORIES=	x11-servers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nesting X server from X.Org
LICENSE=	x11

XORG_CAT=	xserver

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm
USE_GL=		gl
USE_XORG=	x11 xf86driproto glproto randrproto renderproto fixesproto \
		damageproto xcmiscproto xextproto xf86miscproto inputproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		dri2proto resourceproto fontsproto xf86dgaproto videoproto \
		compositeproto trapproto recordproto resourceproto \
		xineramaproto evieproto xkbfile xfont fontenc xkbui \
		xxf86misc xxf86vm xaw7 xmu xpm xext pixman xtrans

CONFIGURE_ARGS=	--disable-dmx --disable-xvfb --disable-xorg --disable-xprint \
		--localstatedir=/var --without-dtrace

PLIST_FILES=	bin/Xnest
MAN1=		Xnest.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hw/xnest/Xnest ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/hw/xnest/Xnest.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
