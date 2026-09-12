PORTNAME=	gnome-sudoku
PORTVERSION=	49.6
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sudoku game for GNOME
WWW=		https://wiki.gnome.org/GnomeSudoku

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	blueprint-compiler>0:devel/blueprint-compiler \
		itstool:textproc/itstool
LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libqqwing.so:games/qqwing \
		libjson-glib-1.0.so:devel/json-glib \
		libgraphene-1.0.so:graphics/graphene
RUN_DEPENDS=	dbus>0:devel/dbus

USES=		compiler:c++11-lang desktop-file-utils gettext gnome meson \
		pkgconfig tar:xz vala:build
USE_GNOME=	cairo glib20 gtk40 libadwaita
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.gnome.Sudoku.gschema.xml

.include <bsd.port.mk>
