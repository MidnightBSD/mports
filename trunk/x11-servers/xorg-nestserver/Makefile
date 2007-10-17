# New ports collection makefile for:    xorg-nestserver
# Date created:		21 July 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11-servers/xorg-nestserver/Makefile,v 1.9 2007/09/13 19:44:55 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xorg-nestserver
PORTVERSION=	1.4
PORTEPOCH=	1
CATEGORIES=	x11-servers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nesting X server from X.Org
LICENSE=	x11

XORG_CAT=	xserver

LIB_DEPENDS=	drm:${PORTSDIR}/graphics/libdrm
USE_XORG=	x11 xf86driproto glproto randrproto renderproto fixesproto \
		damageproto xcmiscproto xextproto xf86miscproto \
		xf86vidmodeproto xf86bigfontproto scrnsaverproto bigreqsproto \
		resourceproto fontsproto xf86dgaproto videoproto \
		compositeproto trapproto recordproto resourceproto \
		xineramaproto evieproto xkbfile xfont fontenc xkbui \
		xxf86misc xxf86vm xaw7 xmu xpm xext pixman

CONFIGURE_ARGS=	--disable-dmx --disable-xvfb --disable-xorg --disable-xprint \
		--localstatedir=/var

PLIST_FILES=	bin/Xnest
MAN1=		Xnest.1

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hw/xnest/Xnest ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/hw/xnest/Xnest.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
