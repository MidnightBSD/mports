# Created by: Gustau Perez <gustau.perez@gmail.com>
# $MidnightBSD$
# $FreeBSD: head/deskutils/gnome-weather/Makefile 393607 2015-08-05 19:13:24Z kwm $

PORTNAME=	gnome-weather
PORTVERSION=	3.16.2.1
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Weather application for GNOME 3

LICENSE=	gpl2

BUILD_DEPENDS=	itstool:${PORTSDIR}/textproc/itstool
LIB_DEPENDS=	libgweather-3.so:${PORTSDIR}/net/libgweather \
		libgjs.so:${PORTSDIR}/lang/gjs

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	gnomedesktop3 gtk30 intlhack
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALLS_ICONS=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.gnome.Weather.Application.gschema.xml

.include <bsd.port.mk>
