# $MidnightBSD: mports/x11-drivers/xf86-video-openchrome/Makefile,v 1.2 2008/03/24 19:23:38 laffer1 Exp $

PORTNAME=	xf86-video-openchrome
PORTVERSION=	0.2.903
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
