PORTNAME=	gnome-connections
PORTVERSION=	50.0
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Remote desktop client for GNOME
WWW=		https://apps.gnome.org/app/org.gnome.Connections/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libgtk-vnc-2.0.so:net/gtk-vnc \
		libhandy-1.so:x11-toolkits/libhandy \
		libfreerdp2.so:net/freerdp \
		libsecret-1.so:security/libsecret

USES=		desktop-file-utils fuse:3 gettext gnome meson pkgconfig \
		shared-mime-info tar:xz vala:build
USE_GNOME=	glib20 gtk30 introspection:build libxml2
GLIB_SCHEMAS=	org.gnome.Connections.gschema.xml
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
