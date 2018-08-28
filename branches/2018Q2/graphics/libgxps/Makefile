# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/graphics/libgxps/Makefile 392537 2015-07-19 22:04:44Z bapt $

PORTNAME=	libgxps
PORTVERSION=	0.2.2
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject based library for rendering XPS documents

LICENSE=	lgpl2.1

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libtiff.so:${PORTSDIR}/graphics/tiff \
		liblcms2.so:${PORTSDIR}/graphics/lcms2

USES=		gettext gmake jpeg libtool libarchive pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	cairo gnomeprefix glib20 intlhack
GNU_CONFIGURE=	yes
MAKE_ARGS+=	V=1
CONFIGURE_ARGS+=	--enable-introspection=no
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
