# $MidnightBSD: mports/x11/pixman/Makefile,v 1.7 2009/09/22 19:34:55 laffer1 Exp $

PORTNAME=	pixman
PORTVERSION=	0.16.0 
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level pixel manipulation library
LICENSE=	x11

XORG_CAT=	lib
USE_AUTOTOOLS=	libtool:22
USE_PERL5_BUILD=yes
USE_GNOME=	ltverhack

OPTIONS=	SIMD "Enable autodection of SIMD features (MMX, SSE2, VMX)" off

.include <bsd.port.pre.mk>

.if defined(WITHOUT_SIMD)
CONFIGURE_ARGS=	--disable-vmx --disable-arm-simd

.if ${ARCH:Namd64}
CONFIGURE_ARGS+=	--disable-mmx --disable-sse2
.endif

.endif

post-patch:
	@${REINPLACE_CMD} -e 's|gtk+-2\.0|disable-gtk|g' \
		${WRKSRC}/configure

.include <bsd.port.post.mk>
