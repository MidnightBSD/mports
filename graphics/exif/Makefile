# $MidnightBSD$
# $FreeBSD: ports/graphics/exif/Makefile,v 1.18 2012/02/07 07:24:15 miwi Exp $

PORTNAME=	exif
PORTVERSION=	0.6.20
CATEGORIES=	graphics
MASTER_SITES=	SF/lib${PORTNAME}/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line utility to read and manipulate EXIF data
LICENSE=	lgpl

LIB_DEPENDS=	exif.12:${PORTSDIR}/graphics/libexif \
		popt.0:${PORTSDIR}/devel/popt

USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
CONFIGURE_ENV+=		POPT_CFLAGS=-I${LOCALBASE}/include POPT_LIBS="-L${LOCALBASE}/lib -lpopt"

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls --without-libiconv-prefix
PLIST_SUB+=	NLS="@comment "
.else
USE_ICONV=	yes
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

MAN1=		exif.1

.include <bsd.port.mk>
