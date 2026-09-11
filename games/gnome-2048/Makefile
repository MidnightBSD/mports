PORTNAME=	gnome-2048
PORTVERSION=	50.2
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Move the tiles until you obtain the 2048 tile
WWW=		https://wiki.gnome.org/Apps/2048

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cargo desktop-file-utils gettext gnome localbase meson pkgconfig \
		tar:xz vala:build

BUILD_DEPENDS=	itstool:textproc/itstool
TEST_DEPENDS=	appstreamcli:devel/appstream

PORTSCOUT=	limitw:1,even

USE_GNOME=	glib20 gtk40 libadwaita libxml2:build
INSTALLS_ICONS=	yes

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

# Meson invokes cargo itself and expects its native target output directory.
MAKE_ENV=	${CARGO_ENV:NCARGO_BUILD_TARGET=*}

GLIB_SCHEMAS=	org.gnome.TwentyFortyEight.gschema.xml

.include <bsd.port.mk>
