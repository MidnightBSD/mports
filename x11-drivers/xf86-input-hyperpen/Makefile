# $MidnightBSD$

PORTNAME=	xf86-input-hyperpen
PORTVERSION=	${HYPERVER}
PORTREVISION=	${HYPERREVISION}
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org hyperpen input driver
LICENSE=	mit

XORG_CAT=	driver

.include <bsd.mport.options.mk>

.if defined(WITH_NEW_XORG)
HYPERVER=	1.4.1
HYPERREVISION=	0
.else
HYPERVER=	1.3.0
HYPERREVISION=	6
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-src_xf86HyperPen.c
.endif

.include <bsd.port.mk>
