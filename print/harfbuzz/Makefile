# $MidnightBSD$

PORTNAME=	harfbuzz
PORTVERSION=	0.9.25
CATEGORIES=	print
MASTER_SITES=	http://www.freedesktop.org/software/harfbuzz/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenType text shaping engine

LICENSE=	mit

LIB_DEPENDS=	freetype:${PORTSDIR}/print/freetype2 \
		icudata:${PORTSDIR}/devel/icu \
		graphite2:${PORTSDIR}/graphics/graphite2

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USES=		gmake pathfix pkgconfig
USE_GNOME=	cairo glib20 ltverhack
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-graphite2

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${PATCHDIR}/extra-src_hb-open-type-private.hh

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libharfbuzz*.so.0

.include <bsd.port.post.mk>
