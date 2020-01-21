PORTNAME=	xf86-input-vmmouse
PORTVERSION=	13.1.0
PORTREVISION=	2
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver

LICENSE=	mit

LIB_DEPENDS=	libhal.so:sysutils/hal

USES=		gmake xorg-cat:driver
CONFIGURE_ARGS=	--with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd10.4

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	The vmmouse protocol is only supported on x86-compatible architectures.

.include <bsd.port.mk>
