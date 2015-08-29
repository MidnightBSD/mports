# $MidnightBSD$

PORTNAME=	harfbuzz
PORTVERSION=	1.0.1
CATEGORIES=	print
MASTER_SITES=	http://www.freedesktop.org/software/harfbuzz/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType text shaping engine

LICENSE=	mit

LIB_DEPENDS=	libfreetype.so:${PORTSDIR}/print/freetype2 \
		libicudata.so:${PORTSDIR}/devel/icu \
		libgraphite2.so:${PORTSDIR}/graphics/graphite2

USE_LDCONFIG=	yes
USES=		gmake libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	cairo glib20
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-graphite2
INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${PATCHDIR}/extra-src_hb-open-type-private.hh

PLIST_SUB+=	LIBVER=0.10000.1

.include <bsd.port.post.mk>
