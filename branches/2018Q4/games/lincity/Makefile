# $MidnightBSD$
# $FreeBSD: ports/games/lincity/Makefile,v 1.24 2007/05/19 20:06:46 flz Exp $

PORTNAME=	lincity
PORTVERSION=	1.13.1
PORTREVISION=	5
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/Lincity%20Development%20Source/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rich city simulation game for X

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpng.so:${PORTSDIR}/graphics/png

USES=		gmake
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE=	NLS SVGALIB
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

SVGALIB_LIB_DEPENDS=	libvga.so:${PORTSDIR}/graphics/svgalib
SVGALIB_CONFIGURE_ON=	--without-x
SVGALIB_CONFIGURE_OFF=	--without-svga

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSVGALIB}
PLIST_SUB+=	PROG="bin/lincity"
.else
USE_XORG=	sm xext
PLIST_SUB+=	PROG="bin/xlincity"
.endif

pre-configure:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|g' ${WRKSRC}/readpng.c

.include <bsd.port.mk>
