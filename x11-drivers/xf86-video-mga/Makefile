# $MidnightBSD: mports/x11-drivers/xf86-video-mga/Makefile,v 1.2 2009/03/16 14:35:31 laffer1 Exp $

PORTNAME=	xf86-video-mga
PORTVERSION=	1.4.10
PORTEPOCH=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org mga display driver
LICENSE=	x11

USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xf86driproto videoproto xextproto glproto
MAN4=		mga.4x

pre-patch:
	${REINPLACE_CMD} \
		-e 's|values.h|sys/limits.h|g' \
		-e 's|MAXSHORT|SHRT_MAX|g' \
		${WRKSRC}/src/mga_arc.c

.include <bsd.port.mk>
