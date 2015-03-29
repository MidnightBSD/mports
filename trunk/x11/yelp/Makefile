# $MidnightBSD$

PORTNAME=	yelp
PORTVERSION=	3.14.1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help browser for the GNOME 3 desktop

LICENSE=	gpl2

BUILD_DEPENDS=	yelp-xsl>=0:${PORTSDIR}/textproc/yelp-xsl \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libwebkitgtk-3.0.so:${PORTSDIR}/www/webkit-gtk3
RUN_DEPENDS=	yelp-xsl>=0:${PORTSDIR}/textproc/yelp-xsl

USES=		desktop-file-utils gettext gmake libtool pathfix \
		pkgconfig tar:xz
USE_XORG=	x11 ice
USE_GNOME=	gnomeprefix gtk30 intlhack libxml2 libxslt
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -fstack-protector
GLIB_SCHEMAS=	org.gnome.yelp.gschema.xml
INSTALL_TARGET=	install-strip

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 900012 || (${OSVERSION} >= 800505 && ${OSVERSION} < 900000)
CONFIGURE_ENV+=	YELP_LZMA_CFLAGS="-I/usr/include" \
		YELP_LZMA_LIBS="-L/usr/lib -llzma"
.else
LIB_DEPENDS+=	liblzma.so:${PORTSDIR}/archivers/xz
.endif

.include <bsd.port.post.mk>
