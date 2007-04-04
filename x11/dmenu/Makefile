# New ports collection makefile for:	dmenu
# Date created:				August 4, 2006
# Whom:					Jeroen Schot <schot@a-eskwadraat.nl>
#
# $MidnightBSD: mports/x11/dmenu/Makefile,v 1.1 2006/12/31 20:30:40 wintellect Exp $
# $FreeBSD: ports/x11/dmenu/Makefile,v 1.4 2006/10/08 10:32:05 erwin Exp $
#

PORTNAME=	dmenu
PORTVERSION=	1.8
CATEGORIES=	x11
MASTER_SITES=	http://www.suckless.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 menu application (not only) for the dwm window manager

USE_XLIB=	yes

FAKE_FLAGS+=	PREFIX=${TRUE_PREFIX}

MAN1=		dmenu.1
PLIST_FILES=	bin/dmenu

.include <bsd.port.mk>
