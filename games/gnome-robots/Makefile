PORTNAME=	gnome-robots
PORTVERSION=	3.38.0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome robots

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool \
		appstream-util:devel/appstream-glib
LIB_DEPENDS=	libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libcanberra.so:audio/libcanberra \
		libgnome-games-support-1.so:games/libgnome-games-support \
		libgee-0.8.so:devel/libgee

PORTSCOUT=	limitw:1,even

USES=		gettext gmake gnome localbase meson pathfix \
		pkgconfig tar:xz xorg
USE_GNOME=	cairo gsound gtk30 intlhack librsvg2 libxml2:build
USE_XORG=	x11
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Robots.gschema.xml

.include <bsd.port.mk>
