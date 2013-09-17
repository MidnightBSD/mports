# $FreeBSD: ports/x11-drivers/xf86-video-newport/Makefile,v 1.2 2007/09/15 14:04:27 flz Exp $
# $MidnightBSD$

PORTNAME=	xf86-video-newport
PORTVERSION=	0.2.3
PORTREVISION=	1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org newport display driver
LICENSE=	mit

XORG_CAT=	driver
USE_XORG=	videoproto
MAN4=		newport.4x

post-patch:
		${REINPLACE_CMD} -e 's|values.h|sys/limits.h|' \
				 -e 's|MAXSHORT|SHRT_MAX|g' \
				 ${WRKSRC}/src/newport_accel.c

.include <bsd.port.mk>
