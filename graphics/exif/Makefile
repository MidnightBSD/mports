PORTNAME=	exif
PORTVERSION=	0.6.22
CATEGORIES=	graphics
MASTER_SITES=	https://github.com/libexif/exif/releases/download/exif-${PORTVERSION:S|.|_|g}-release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line utility to read and manipulate EXIF data
WWW=		https://libexif.github.io/ \
		https://github.com/libexif/exif

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libexif.so:graphics/libexif \
		libpopt.so:devel/popt

USES=		cpe gmake localbase pkgconfig tar:xz

GNU_CONFIGURE=	yes

CPE_VENDOR=	curtis_galloway

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_CONFIGURE_OFF=	--without-libiconv-prefix
NLS_CONFIGURE_ON=	${ICONV_CONFIGURE_ARG}
NLS_USES=		gettext iconv

.include <bsd.port.mk>
