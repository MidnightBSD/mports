# $MidnightBSD$

PORTNAME=	harfbuzz
PORTVERSION=	1.3.2
CATEGORIES=	print
MASTER_SITES=	http://www.freedesktop.org/software/harfbuzz/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType text shaping engine

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libicudata.so:${PORTSDIR}/devel/icu \
		libgraphite2.so:${PORTSDIR}/graphics/graphite2

USE_LDCONFIG=	yes
USES=		compiler:c++0x gmake libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	cairo glib20 introspection:build
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-graphite2 --with-gobject=yes
INSTALL_TARGET=	install-strip

PLIST_SUB+=	LIBVER=0.10302.0

EXTRA_PATCHES=	${PATCHDIR}/extra-src_hb-open-type-private.hh

.include <bsd.port.mk>
