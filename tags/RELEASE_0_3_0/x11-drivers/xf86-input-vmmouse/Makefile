# $MidnightBSD: mports/x11-drivers/xf86-input-vmmouse/Makefile,v 1.2 2008/03/31 15:35:13 laffer1 Exp $

PORTNAME=	xf86-input-vmmouse
PORTVERSION=	12.6.3
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmmouse input driver
LICENSE=	x11

XORG_CAT=	driver
CONFIGURE_ARGS= --with-hal-callouts-dir=${PREFIX}/libexec/hal/scripts

MAN1=		vmmouse_detect.1
MAN4=		vmmouse.4x

ONLY_FOR_ARCHS=	i386 amd64
ONLY_FOR_ARCHS_REASON=	The vmmouse protocol is only supported on x86-compatible architectures.

.include <bsd.port.mk>
