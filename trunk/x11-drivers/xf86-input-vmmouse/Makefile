# $MidnightBSD$

PORTNAME=	xf86-input-vmmouse
PORTVERSION=	13.0.0
PORTREVISION=	0
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver
LICENSE=	mit
LIB_DEPENDS+=	hal.1:${PORTSDIR}/sysutils/hal

XORG_CAT=	driver
CONFIGURE_ARGS=	--with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts
USE_GMAKE=	yes

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	The vmmouse protocol is only supported on x86-compatible architectures.

.include <bsd.mport.options.mk>

.if defined(WITH_NEW_XORG)
PLIST_SUB+=	NEW=""
.else
PLIST_SUB+=	NEW="@comment "
.endif

.include <bsd.port.mk>
