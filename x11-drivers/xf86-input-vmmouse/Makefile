# $MidnightBSD$

PORTNAME=	xf86-input-vmmouse
PORTVERSION=	13.0.0
PORTREVISION=	1
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver

LICENSE=	mit

LIB_DEPENDS+=	libhal.so:${PORTSDIR}/sysutils/hal

XORG_CAT=	driver
CONFIGURE_ARGS=	--with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts
USE_GMAKE=	yes

.include <bsd.mport.options.mk>

.if defined(WITH_NEW_XORG)
PLIST_SUB+=	NEW=""
.else
PLIST_SUB+=	NEW="@comment "
.endif

.include <bsd.port.mk>
