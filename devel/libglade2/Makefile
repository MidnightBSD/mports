PORTNAME=	libglade2
PORTVERSION=	2.6.4
PORTREVISION?=	11
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME/sources/${PORTNAME:S/2$//}/${PORTVERSION:C/..$//}
DISTNAME=	${PORTNAME:S/2$//}-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME glade library

LICENSE=	lgpl

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libfontconfig.so:x11-fonts/fontconfig

USES=		tar:bzip2

RUN_DEPENDS=	xmlcatmgr:textproc/xmlcatmgr

USES+=		gmake gnome libtool pathfix pkgconfig localbase
USE_GNOME=	cairo gdkpixbuf libxml2 gtk20
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc \
		--disable-gtk-doc \
		--with-xml-catalog=${LOCALBASE}/share/xml/catalog.ports

PLIST_SUB=	XMLCATALOG="${LOCALBASE}/bin/xmlcatalog" \
		CATALOG_PORTS_XML="${LOCALBASE}/share/xml/catalog.ports"

post-patch:
	@${REINPLACE_CMD} -e 's|glib-2.0|gmodule-2.0 glib-2.0|g' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -E 's/in (python.*)+ none/in none/' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s/ doc / /g" ${WRKSRC}/Makefile.in

post-install:
	${MKDIR} ${PREFIX}/lib/libglade/2.0

.include <bsd.port.mk>
