PORTNAME=	libdmtx
PORTVERSION=	0.7.4
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for reading and writing Data Matrix barcodes
WWW=		https://libdmtx.sourceforge.net/

LICENSE=	bsd2

LIB_DEPENDS=	libMagickWand-7.so:graphics/ImageMagick7

USES=		tar:bzip2 libtool
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INSTALL_TARGET=	install-strip

post-patch:
	@${REINPLACE_CMD} -e '/^pkgconfigdir /s:(libdir):{prefix}/libdata:' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
