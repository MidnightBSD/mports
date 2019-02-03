# $MidnightBSD$
# $FreeBSD: ports/graphics/exif/Makefile,v 1.18 2012/02/07 07:24:15 miwi Exp $

PORTNAME=	exif
PORTVERSION=	0.6.21
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line utility to read and manipulate EXIF data

LICENSE=	lgpl2.1

LIB_DEPENDS=	libexif.so:${PORTSDIR}/graphics/libexif \
		libpopt.so:${PORTSDIR}/devel/popt

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

CONFIGURE_ENV=	POPT_CFLAGS=-I${LOCALBASE}/include POPT_LIBS="-L${LOCALBASE}/lib -lpopt"
GNU_CONFIGURE=	yes
USES=		gmake pkgconfig

NLS_CONFIGURE_ON=	--enable-nls ${ICONV_CONFIGURE_ARG}
NLS_CONFIGURE_OFF=	--disable-nls --without-libiconv-prefix
NLS_USES=		gettext iconv

.include <bsd.port.mk>
