# $MidnightBSD$

PORTNAME=	xf86-input-penmount
PORTVERSION=	${PEN_VERSION}
PORTREVISION=	${PEN_REVISION}
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org penmount input driver
LICENSE=	mit

XORG_CAT=	driver

.include <bsd.mport.options.mk>

.if defined(WITH_NEW_XORG)
PEN_VERSION=	1.5.0
PEN_REVISION=	0
.else
PEN_VERSION=	1.4.1
PEN_REVISION=	1
.endif

.include <bsd.port.mk>
