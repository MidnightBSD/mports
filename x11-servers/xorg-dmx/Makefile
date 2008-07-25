# New ports collection makefile for:    xorg-dmx
# Date created:		13 Mar 2005
# Whom:			lesi@FreeBSD.org
#
# $FreeBSD: ports/x11-servers/xorg-dmx/Makefile,v 1.7 2007/09/13 19:44:55 flz Exp $
# $MidnightBSD: mports/x11-servers/xorg-dmx/Makefile,v 1.3 2007/11/01 05:51:23 ctriv Exp $
#

PORTNAME=	xorg-dmx
PORTVERSION=	1.4
PORTEPOCH=	1
PORTREVISION=	2
CATEGORIES=	x11-servers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed Multihead X from X.Org
LICENSE=	x11

XORG_CAT=	xserver

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm
USE_XORG=	x11 xf86driproto glproto randrproto renderproto fixesproto \
		damageproto xcmiscproto xextproto xf86miscproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		resourceproto fontsproto xf86dgaproto videoproto \
		compositeproto trapproto recordproto resourceproto \
		xineramaproto evieproto xkbfile xfont fontenc xkbui \
		xxf86misc xxf86vm xaw7 xmu xpm xext xrender xfixes xi dmxproto \
		xau dmx xtst xres pixman xtrans
		
CONFIGURE_ARGS=	--disable-xprint --disable-xvfb --disable-xorg --disable-xnest \
		--enable-dmx --localstatedir=/var

MAN1=		Xdmx.1 dmxtodmx.1 vdltodmx.1 xdmxconfig.1

do-install:
	cd ${WRKSRC}/hw/dmx; ${MAKE} ${FAKE_MAKEARGS} install

OPTIONS=	HAL "Compile with HAL config support" on

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_HAL)
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal
CONFIGURE_ARGS+=	--enable-config-hal=yes
.else
CONFIGURE_ARGS+=	--enable-config-hal=no
.endif

.include <bsd.port.post.mk>
