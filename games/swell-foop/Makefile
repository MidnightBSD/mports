PORTNAME=	swell-foop
PORTVERSION=	48.1
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome swell-foop
WWW=		https://wiki.gnome.org/Swell%20Foop

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libgnome-games-support-2.so:games/libgnome-games-support2
RUN_DEPENDS=	dbus>0:devel/dbus

USES=		gettext gnome localbase meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 gtk40 librsvg2 pango libadwaita
GLIB_SCHEMAS=	org.gnome.SwellFoop.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
