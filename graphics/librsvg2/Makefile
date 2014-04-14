# $MidnightBSD$

PORTNAME=	librsvg2
PORTVERSION=	2.36.4
PORTREVISION=	1
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/librsvg/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
DISTNAME=	librsvg-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for parsing and rendering SVG vector-graphic files

LICENSE=	gpl2

BUILD_DEPENDS=	freetype-config:${PORTSDIR}/print/freetype2
LIB_DEPENDS=	freetype:${PORTSDIR}/print/freetype2 \
		croco-0.6:${PORTSDIR}/textproc/libcroco
RUN_DEPENDS=	gtk-engines2>=2.7.5_1:${PORTSDIR}/x11-themes/gtk-engines2

USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehier gnomeprefix libgsf ltverhack gtk20 \
		introspection:build
USES=		gettext gmake pathfix pkgconfig tar:xz
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--with-svgz \
		--with-croco \
		--disable-Bsymbolic \
		--enable-gtk-theme

post-patch:
	@${REINPLACE_CMD} -e 's|GTK3_REQUIRED=3.0.0|GTK3_REQUIRED=9.90.0|g' \
		${WRKSRC}/configure

.include <bsd.port.mk>
