# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-photos/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-photos
PORTVERSION=	3.16.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Photo application for GNOME 3

LICENSE=	gpl2

BUILD_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue \
		itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libexempi.so:${PORTSDIR}/textproc/exempi \
		libgfbgraph-0.2.so:${PORTSDIR}/net/gfbgraph \
		libgegl-0.3.so:${PORTSDIR}/graphics/gegl3 \
		libgrilo-0.2.so:${PORTSDIR}/net/grilo \
		libexif.so:${PORTSDIR}/graphics/libexif \
		libtracker-control-1.0.so:${PORTSDIR}/sysutils/tracker \
		libgjs.so:${PORTSDIR}/lang/gjs \
		libbabl-0.1.so:${PORTSDIR}/x11/babl \
		libgdata.so:${PORTSDIR}/devel/libgdata
RUN_DEPENDS=	geoclue>=0:${PORTSDIR}/net/geoclue

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomedesktop3 gtk30 intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include -Wno-error=format-nonliteral
CFLAGS=		-I${LOCALBASE}/include -Wno-error=format-nonliteral
LIBS+=		-L${LOCALBASE}/lib

GLIB_SCHEMAS=	org.gnome.photos.gschema.xml

.include <bsd.port.mk>
