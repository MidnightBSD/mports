# $MidnightBSD$

PORTNAME=	xf86-input-mutouch
PORTVERSION=	1.3.0
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org mutouch input driver
LICENSE=	mit

XORG_CAT=	driver

.include <bsd.mport.options.mk>

.if !defined(WITH_NEW_XORG)
IGNORE=		does not build with xorg-server 1.7.7
.endif

.include <bsd.port.mk>
