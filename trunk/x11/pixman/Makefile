# $MidnightBSD: mports/x11/pixman/Makefile,v 1.11 2011/09/17 01:48:11 laffer1 Exp $

PORTNAME=	pixman
PORTVERSION=	0.24.2
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib
USE_AUTOTOOLS=	libtool
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack
CONFIGURE_ARGS=	--disable-gtk

OPTIONS=	SIMD "Enable SIMD features autodetection (MMX, SSE2, VMX)" off

.include <bsd.port.pre.mk>

.if defined(WITHOUT_SIMD)
CONFIGURE_ARGS=	--disable-vmx --disable-arm-simd
. if ! ${MACHINE_CPU:Mmmx}
CONFIGURE_ARGS+=	--disable-mmx
. endif
. if ! ${MACHINE_CPU:Msse2}
CONFIGURE_ARGS+=	--disable-sse2
. endif
.endif

.include <bsd.port.post.mk>
