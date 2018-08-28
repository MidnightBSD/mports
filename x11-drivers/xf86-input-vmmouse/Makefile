# $MidnightBSD$

PORTNAME=	xf86-input-vmmouse
PORTVERSION=	13.0.0
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver

LICENSE=	mit

LIB_DEPENDS+=	libhal.so:${PORTSDIR}/sysutils/hal

USES=		gmake
XORG_CAT=	driver
CONFIGURE_ARGS=	--with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts

.include <bsd.port.mk>
