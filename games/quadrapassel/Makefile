PORTNAME=	quadrapassel
PORTVERSION=	40.2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome quadrapassel
WWW=		https://wiki.gnome.org/Apps/Quadrapassel

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib \
		itstool:textproc/itstool
LIB_DEPENDS=	libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libcanberra.so:audio/libcanberra \
		libclutter-1.0.so:graphics/clutter \
		libclutter-gtk-1.0.so:graphics/clutter-gtk3 \
		libcogl.so:graphics/cogl \
		libjson-glib-1.0.so:devel/json-glib \
		libmanette-0.2.so:games/libmanette

PORTSCOUT=	limitw:1,even

USES=		gettext gl gnome localbase meson pathfix pkgconfig tar:xz vala:build xorg
USE_GNOME=	cairo gsound gtk30 intlhack librsvg2 libxml2:build
USE_GL=		egl gl
USE_XORG=	x11 xcomposite xdamage xext xfixes xi xrandr
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Quadrapassel.gschema.xml

.include <bsd.port.mk>
