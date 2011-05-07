# $FreeBSD: ports/x11/setxkbmap/Makefile,v 1.2 2007/09/13 19:45:01 flz Exp $
# $MidnightBSD: mports/x11/setxkbmap/Makefile,v 1.2 2008/06/11 03:14:02 laffer1 Exp $

PORTNAME=	setxkbmap
PORTVERSION=	1.2.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set the keyboard using the X Keyboard Extension
LICENSE=	sgi

XORG_CAT=	app
USE_XORG=	xkbfile x11

CONFIGURE_ARGS=	--with-xkb-config-root=${LOCALBASE}/share/X11/xkb

PLIST_FILES=	bin/setxkbmap

MAN1=		setxkbmap.1

.include <bsd.port.mk>
