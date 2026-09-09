PORTNAME=	gnome-mahjongg
DISTVERSION=	47.2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome mahjongg
WWW=		https://wiki.gnome.org/Apps/Mahjongg

LICENSE=	gpl2+ CC-BY-SA-3.0 CC0-1.0
LICENSE_COMB=	multi
LICENSE_FILE_gpl2+ =	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
RUN_DEPENDS=	dbus>0:devel/dbus

USES=		desktop-file-utils gettext gmake gnome localbase meson pkgconfig tar:xz vala:build
USE_GNOME=	cairo glib20 gtk40 libadwaita librsvg2
GLIB_SCHEMAS=	org.gnome.Mahjongg.gschema.xml
INSTALLS_ICONS=	yes

PORTSCOUT=	limit:^47\.

.include <bsd.port.mk>
