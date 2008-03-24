# New ports collection makefile for:	xf86-video-openchrome
# Date Created:				17 Sep 2007
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/x11-drivers/xf86-video-openchrome/Makefile,v 1.7 2008/03/14 23:20:55 pav Exp $
#

PORTNAME=	xf86-video-openchrome
PORTVERSION=	0.2.901
CATEGORIES=	x11-drivers
MASTER_SITES=	http://www.openchrome.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org openChrome display driver
LICENSE=	x11

USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	videoproto xf86driproto xextproto xvmc glproto
MAN4=		openchrome.4x

MAKE_ARGS+=	drivermandir=${LOCALBASE}/man/man4

.include <bsd.port.mk>
