PORTNAME=	lightsoff
PORTVERSION=	40.0.1
PORTREVISION=	3
CATEGORIES=	games gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome ligthsoff
WWW=		https://wiki.gnome.org/Lightsoff

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libclutter-1.0.so:graphics/clutter \
		libcogl.so:graphics/cogl \
		libjson-glib-1.0.so:devel/json-glib

PORTSCOUT=	limitw:1,even

USES=		gettext gl gmake gnome localbase meson \
		pathfix pkgconfig sqlite tar:xz vala:build xorg
USE_GNOME=	cairo gtk30 intlhack librsvg2 libxml2:build
USE_XORG=	x11 xcomposite xdamage xext xfixes xi xrandr
USE_GL=		egl gl

GLIB_SCHEMAS=	org.gnome.LightsOff.gschema.xml

.include <bsd.port.mk>
