# $MidnightBSD$
# $FreeBSD: ports/graphics/webp/Makefile,v 1.10 2011/11/09 15:25:35 miwi Exp $

PORTNAME=	webp
PORTVERSION=	0.1.3
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google WebP image format conversion tool

LICENSE=	bsd3

LIB_DEPENDS=	libjpeg.so:${PORTSDIR}/graphics/jpeg \
		libpng.so:${PORTSDIR}/graphics/png

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include -L${LOCALBASE}/lib

.include <bsd.port.mk>
