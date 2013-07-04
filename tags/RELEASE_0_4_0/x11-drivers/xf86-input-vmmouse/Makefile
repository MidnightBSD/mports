# $MidnightBSD: mports/x11-drivers/xf86-input-vmmouse/Makefile,v 1.4 2011/05/07 21:11:25 laffer1 Exp $

PORTNAME=	xf86-input-vmmouse
PORTVERSION=	12.6.9
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver
LICENSE=	mit

XORG_CAT=	driver
CONFIGURE_ARGS=	--with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts

MAN1=		vmmouse_detect.1
MAN4=		vmmouse.4x

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	The vmmouse protocol is only supported on x86-compatible architectures.

USE_GMAKE=	yes

.include <bsd.port.mk>
