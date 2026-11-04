PORTNAME=	quadrapassel
PORTVERSION=	51.0
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome quadrapassel
WWW=		https://wiki.gnome.org/Apps/Quadrapassel

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig tar:xz vala:build

BUILD_DEPENDS=	blueprint-compiler:devel/blueprint-compiler
LIB_DEPENDS=	libmanette-0.2.so:games/libmanette \
		libopenal.so:audio/openal-soft \
		libsndfile.so:audio/libsndfile

PORTSCOUT=	limitw:1,even

USE_GNOME=	glib20 gtk40 libadwaita
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Quadrapassel.gschema.xml

.include <bsd.port.mk>
