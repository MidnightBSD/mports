# New ports collection makefile for:	setxkbmap
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/setxkbmap/Makefile,v 1.2 2007/09/13 19:45:01 flz Exp $
# $MidnightBSD: mports/x11/setxkbmap/Makefile,v 1.1 2007/10/04 05:59:40 ctriv Exp $
#

PORTNAME=	setxkbmap
PORTVERSION=	1.0.4
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
