PORTNAME=	gnome-chess
PORTVERSION=	3.38.1
PORTREVISION=	2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gnome chess

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vala:lang/vala \
		itstool:textproc/itstool \
		appstream-util:devel/appstream-glib

PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gl gnome localbase meson \
		pkgconfig python:build tar:xz
USE_GNOME=	cairo gtk30 librsvg2 libxml2:build
INSTALLS_ICONS=	yes
USE_GL=		gl egl
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.Chess.gschema.xml

OPTIONS_DEFINE=	GNUCHESS
OPTIONS_DEFAULT=GNUCHESS

GNUCHESS_DESC=	Use gnuchess engine for computer player
GNUCHESS_RUN_DEPENDS=	gnuchess:games/gnuchess

.include <bsd.port.mk>
