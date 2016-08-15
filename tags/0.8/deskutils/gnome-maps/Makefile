# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-maps/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-maps
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Map application for GNOME 3

LICENSE=	gpl2

BUILD_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libcanberra-gtk3.so:${PORTSDIR}/audio/libcanberra-gtk3 \
		libgeocode-glib.so:${PORTSDIR}/net/geocode-glib \
		libgee-0.8.so:${PORTSDIR}/devel/libgee \
		libchamplain-0.12.so:${PORTSDIR}/graphics/libchamplain \
		libfolks.so:${PORTSDIR}/net-im/folks \
		libgjs.so:${PORTSDIR}/lang/gjs
RUN_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomedesktop3 gtk30 intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.gnome.Maps.gschema.xml

.include <bsd.port.mk>
