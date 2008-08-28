# New ports collection makefile for:	xf86-video-mga
# Date Created:				17 Feb 2006
# Whom:					Florent Thoumie <flz@FreeBSD.org>
#
# $FreeBSD: ports/x11-drivers/xf86-video-mga/Makefile,v 1.3 2007/10/09 19:13:08 flz Exp $
# $MidnightBSD$
#

PORTNAME=	xf86-video-mga
PORTVERSION=	1.9.100
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org mga display driver
LICENSE=	x11

USE_GL=		gl

XORG_CAT=	driver
USE_XORG=	xf86driproto videoproto xextproto glproto
MAN4=		mga.4x
USE_REINPLACE=	yes

pre-patch:
	${REINPLACE_CMD} \
		-e 's|values.h|sys/limits.h|g' \
		-e 's|MAXSHORT|SHRT_MAX|g' \
		${WRKSRC}/src/mga_arc.c

.include <bsd.port.mk>
