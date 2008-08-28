# New ports collection makefile for:	dmenu
# Date created:				August 4, 2006
# Whom:					Jeroen Schot <schot@a-eskwadraat.nl>
#
# $MidnightBSD: mports/x11/dmenu/Makefile,v 1.6 2008/03/22 07:07:34 ctriv Exp $
# $FreeBSD: ports/x11/dmenu/Makefile,v 1.4 2006/10/08 10:32:05 erwin Exp $
#

PORTNAME=	dmenu
PORTVERSION=	3.6
CATEGORIES=	x11
MASTER_SITES=	http://www.suckless.org/download/ \
		http://schot.a-eskwadraat.nl/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 menu application (not only) for the dwm window manager
LICENSE=	mit

USE_XORG=	x11

FAKE_OPTS=	trueprefix

MAN1=		dmenu.1
PLIST_FILES=	bin/dmenu bin/dmenu_path bin/dmenu_run

.include <bsd.port.pre.mk>

# Just stick this at the end 
FAKE_MAKEARGS+= MANPREFIX=${PREFIX}/man

.include <bsd.port.post.mk>
