# $MidnightBSD$

PORTNAME=	xf86-video-openchrome
PORTVERSION=	0.2.904
PORTREVISION=	1
CATEGORIES=	x11-drivers
MASTER_SITES=	http://www.openchrome.org/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org openChrome display driver
LICENSE=	mit

USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	videoproto xf86driproto xextproto xvmc glproto
MAN4=		openchrome.4x

MAKE_ARGS+=	drivermandir=${LOCALBASE}/man/man4

ONLY_FOR_ARCHS=	amd64 i386

.include <bsd.port.mk>
