# New ports collection makefile for:    lincity
# Date created:         13 Feb 1997
# Whom:                 Julian Assange
#
# $MidnightBSD: mports/games/lincity/Makefile,v 1.4 2009/10/03 00:25:53 laffer1 Exp $
# $FreeBSD: ports/games/lincity/Makefile,v 1.24 2007/05/19 20:06:46 flz Exp $
#

PORTNAME=	lincity
PORTVERSION=	1.13.1
PORTREVISION=	3
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/Lincity%20Development%20Source/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rich city simulation game for X
LICENSE=	gpl2

LIB_DEPENDS=	png:${PORTSDIR}/graphics/png

.if ${CC} == "clang"
USE_CSTD=	c89
.endif

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN6=		lincity.6

pre-configure:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|g' ${WRKSRC}/readpng.c

.if defined(WITH_SVGALIB)
LIB_DEPENDS+=	vga.1:${PORTSDIR}/graphics/svgalib
CONFIGURE_ARGS+=	--without-x
PLIST_SUB=	PROG="bin/lincity"
.else
USE_XORG=	sm xext
CONFIGURE_ARGS+=	--without-svga
PLIST_SUB=	PROG="bin/xlincity"
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
