# $MidnightBSD: mports/graphics/webp/Makefile,v 1.1 2012/03/11 03:31:33 laffer1 Exp $
# $FreeBSD: ports/graphics/webp/Makefile,v 1.10 2011/11/09 15:25:35 miwi Exp $

PORTNAME=	webp
PORTVERSION=	0.1.3
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	GOOGLE_CODE
DISTNAME=	lib${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google WebP image format conversion tool
LICENSE=	bsd3

LIB_DEPENDS=	jpeg.11:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include -L${LOCALBASE}/lib

MAN1=		cwebp.1 dwebp.1

.include <bsd.port.mk>
