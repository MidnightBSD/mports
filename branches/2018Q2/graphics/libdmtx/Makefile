# $MidnightBSD$
# $FreeBSD: ports/graphics/libdmtx/Makefile,v 1.10 2011/10/11 07:17:43 mm Exp $

PORTNAME=	libdmtx
PORTVERSION=	0.7.4
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for reading and writing Data Matrix barcodes
LICENSE=	other

LIB_DEPENDS=	libMagickWand-6.so:${PORTSDIR}/graphics/ImageMagick

USES=		tar:bzip2 libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

post-patch:
	@${REINPLACE_CMD} -e '/^pkgconfigdir /s:(libdir):{prefix}/libdata:' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
