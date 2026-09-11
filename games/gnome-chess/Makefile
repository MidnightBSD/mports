PORTNAME=	gnome-chess
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome chess
WWW=		https://wiki.gnome.org/Apps/Chess

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
RUN_DEPENDS=	dbus>0:devel/dbus

PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig \
		python:build tar:xz vala:build
USE_GNOME=	cairo gtk40 libadwaita librsvg2 libxml2:build
INSTALLS_ICONS=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}

LDFLAGS+=	-lm

GLIB_SCHEMAS=	org.gnome.Chess.gschema.xml

OPTIONS_DEFINE=		GNUCHESS
OPTIONS_DEFAULT=	GNUCHESS

GNUCHESS_DESC=		Use gnuchess engine for computer player
GNUCHESS_RUN_DEPENDS=	gnuchess:games/gnuchess

.include <bsd.port.mk>
