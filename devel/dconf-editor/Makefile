PORTNAME=	dconf-editor
PORTVERSION=	49.0
PORTREVISION=	0
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Viewer and editor of applications internal settings
WWW=		https://gitlab.gnome.org/GNOME/dconf-editor

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libhandy-1.so:x11-toolkits/libhandy \
		libdconf.so:devel/dconf
RUN_DEPENDS=	dconf>0:devel/dconf \
		dbus>0:devel/dbus

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig tar:xz \
		vala:build
USE_GNOME=	glib20 gtk30 libxml2:build
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	ca.desrt.dconf-editor.gschema.xml

.include <bsd.port.mk>
