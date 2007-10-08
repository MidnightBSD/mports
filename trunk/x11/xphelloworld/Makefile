# New ports collection makefile for:	xphelloworld
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11/xphelloworld/Makefile,v 1.1 2007/05/19 20:28:07 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xphelloworld
PORTVERSION=	1.0.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sends a test page to an Xprint printer
LICENSE=	x11

XORG_CAT=	app
USE_XORG=	x11 xaw8 xprintutil xp xprintapputil xt

PLIST_FILES=	bin/xphelloworld \
		bin/xpsimplehelloworld \
		bin/xpxthelloworld

MAN1=		xphelloworld.1 \
		xpsimplehelloworld.1 \
		xpxthelloworld.1

.include <bsd.port.mk>
