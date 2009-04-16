# $MidnightBSD: mports/mail/wmymail/Makefile,v 1.2 2007/03/22 04:29:57 ctriv Exp $

PORTNAME=	wmymail
PORTVERSION=	0.2
PORTREVISION=	2
CATEGORIES=	mail x11
MASTER_SITES=	http://dockapps.org/files/65/96/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Check inbox using a WindowMaker DockApp
LICENSE=	unknown

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp
RUN_DEPENDS=	fetchmail:${PORTSDIR}/mail/fetchmail

USE_XORG=	x11

NO_MAN=
PLIST_FILES=	bin/wmymail

CFLAGS+= 	-I/usr/local/include -L/usr/local/lib

.include <bsd.port.mk>
