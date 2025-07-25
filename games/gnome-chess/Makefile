PORTNAME=	gnome-chess
PORTVERSION=	43.0
PORTREVISION=	2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome chess
WWW=		https://wiki.gnome.org/Apps/Chess

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-util:devel/appstream-glib \
		itstool:textproc/itstool
LIB_DEPENDS=	libadwaita-1.so:x11-toolkits/libadwaita

PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gl gnome localbase meson pkgconfig \
		python:build tar:xz vala:build
USE_GNOME=	cairo gtk40 librsvg2 libxml2:build
USE_GL=		egl gl
BINARY_ALIAS=	python3=${PYTHON_VERSION}

LDFLAGS+=	-lm

GLIB_SCHEMAS=	org.gnome.Chess.gschema.xml

OPTIONS_DEFINE=		GNUCHESS
OPTIONS_DEFAULT=	GNUCHESS

GNUCHESS_DESC=		Use gnuchess engine for computer player
GNUCHESS_RUN_DEPENDS=	gnuchess:games/gnuchess

.include <bsd.port.mk>
