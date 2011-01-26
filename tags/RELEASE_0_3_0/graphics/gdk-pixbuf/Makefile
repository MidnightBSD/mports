# New ports collection makefile for:	gdk-pixbuf
# Date created:		September 24, 2008
# Whom:			laffer1
#
# $MidnightBSD: mports/graphics/gdk-pixbuf/Makefile,v 1.5 2010/05/05 19:22:06 vganji Exp $

PORTNAME?=	gdk-pixbuf
PORTVERSION=	0.22.0
PORTREVISION=	2
CATEGORIES?=	graphics
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/gdk-pixbuf/0.22
DISTNAME=	gdk-pixbuf-${PORTVERSION}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	A graphic library for GTK+
LICENSE=	gpl2

LIB_DEPENDS+=	png.6:${PORTSDIR}/graphics/png \
		tiff.4:${PORTSDIR}/graphics/tiff \
		jpeg.11:${PORTSDIR}/graphics/jpeg

USE_AUTOTOOLS=	libtool:22
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_XORG=	xt xi x11
USE_GNOME+=	gnomehack gtk12
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc --enable-shared=yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LIBS="-L${LOCALBASE}/lib" \
		BUILD_CANVAS="${BUILD_CANVAS}"
CONFIGURE_TARGET=	--target=${MACHINE_ARCH}-unknown-freebsd6.0 \
			--build=${ARCH}-unknown-freebsd6.0 \
			--host=${ARCH}-unknown-freebsd6.0

BUILD_CANVAS?=	no

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' \
		-e 's/freebsd/freebsd*|midnightbsd/' \
		 ${WRKSRC}/configure

.include <bsd.port.mk>
