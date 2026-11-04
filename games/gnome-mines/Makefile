PORTNAME=	gnome-mines
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clear hidden mines from a minefield
WWW=		https://gitlab.gnome.org/GNOME/gnome-mines

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libgnome-games-support-2.so:games/libgnome-games-support2
RUN_DEPENDS=	gtk-update-icon-cache:graphics/gtk-update-icon-cache

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig \
		python:build tar:xz vala:build
USE_GNOME=	glib20 gtk40 libadwaita

BINARY_ALIAS=	python3=${PYTHON_VERSION}
GLIB_SCHEMAS=	org.gnome.Mines.gschema.xml
INSTALLS_ICONS=	yes
PORTSCOUT=	limitw:1,even

.include <bsd.port.mk>
