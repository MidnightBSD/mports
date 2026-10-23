PORTNAME=	devhelp
PORTVERSION=	43.0
PORTREVISION=	1
CATEGORIES=	devel gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Developer help browser for GNOME
WWW=		https://wiki.gnome.org/Apps/Devhelp

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSES/GPL-3.0-or-later.txt

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libwebkit2gtk-4.1.so:www/webkit2-gtk@41 \
		libgedit-amtk-5.so:x11-toolkits/amtk

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lib gettext gnome localbase meson pkgconfig \
		python:build tar:xz
USE_GNOME=	cairo gtk30 introspection

INSTALLS_ICONS=	yes

USE_LDCONFIG=	yes

GLIB_SCHEMAS=	org.gnome.devhelp.gschema.xml \
		org.gnome.libdevhelp-3.gschema.xml

.include <bsd.port.mk>
