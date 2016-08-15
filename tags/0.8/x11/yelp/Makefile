# $MidnightBSD$

PORTNAME=	yelp
PORTVERSION=	3.16.1
PORTREVISION=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help browser for the GNOME 3 desktop

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	yelp-xsl>=0:${PORTSDIR}/textproc/yelp-xsl \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libwebkitgtk-3.0.so:${PORTSDIR}/www/webkit-gtk3
RUN_DEPENDS=	yelp-xsl>=0:${PORTSDIR}/textproc/yelp-xsl

USES=		desktop-file-utils gettext gmake libtool pathfix \
		pkgconfig tar:xz
USE_XORG=	x11 ice
USE_GNOME=	gtk30 intlhack libxml2 libxslt
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.gnome.yelp.gschema.xml
INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

CONFIGURE_ENV+=	YELP_LZMA_CFLAGS="-I/usr/include" \
		YELP_LZMA_LIBS="-L/usr/lib -llzma"

.include <bsd.port.post.mk>
