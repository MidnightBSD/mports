PORTNAME=	librsvg
PORTVERSION=	2.40.21
PORTREVISION=	1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for parsing and rendering SVG vector-graphic files
WWW=		https://live.gnome.org/LibRsvg

LICENSE=	gpl2

CONFLICTS_INSTALL=	librsvg2-rust
PORTSCOUT=	limit:^2\.40\.

BUILD_DEPENDS=	valac:lang/vala
LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig \
		libpng.so:graphics/png \
		libcroco-0.6.so:textproc/libcroco

USES=		cpe gettext gmake gnome libtool localbase pathfix pkgconfig tar:xz
USE_GNOME=	cairo gnomeprefix libgsf gdkpixbuf introspection:build \
		libxml2 pango
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-vala \
		--disable-Bsymbolic

PLIST_SUB+=	PORTVERSION=${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|GTK3_REQUIRED=3.[0-9][0-9].[0-9]|GTK3_REQUIRED=9.90.0|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
