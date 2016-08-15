# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-clocks/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-clocks
PORTVERSION=	3.16.1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clocks for GNOME 3

LICENSE=	gpl2

BUILD_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3 \
		libgeocode-glib.so:${PORTSDIR}/net/geocode-glib \
		libgweather-3.so:${PORTSDIR}/net/libgweather
RUN_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_LDCONFIG=	yes
USE_GNOME=	gnomedesktop3 gsound gtk30 intlhack
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.clocks.gschema.xml

post-patch:
# for base gcc
	@${REINPLACE_CMD} -e 's|-Wno-unused-but-set-variable||g' \
		${WRKSRC}/Makefile.in

.include <bsd.port.mk>
