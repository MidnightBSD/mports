PORTNAME=	gnome-robots
DISTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	games gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME robots
WWW=		https://gitlab.gnome.org/GNOME/gnome-robots

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
LIB_DEPENDS=	libglycin-2.so:graphics/glycin2 \
		libgraphene-1.0.so:graphics/graphene

USES=		cargo desktop-file-utils gettext gnome meson pkgconfig tar:bz2
USE_GNOME=	glib20 gtk40 libadwaita librsvg2 libxml2
INSTALLS_ICONS=	yes

USE_GITLAB=	yes
GL_SITE=	https://gitlab.gnome.org
GL_ACCOUNT=	GNOME

CARGO_BUILD=	no
CARGO_INSTALL=	no
CARGO_TEST=	no

# Meson invokes cargo itself and expects the native target output directory.
MAKE_ENV=	${CARGO_ENV:NCARGO_BUILD_TARGET=*}

GLIB_SCHEMAS=	org.gnome.Robots.gschema.xml

post-install:
	${STRIP_CMD} ${PREFIX}/bin/gnome-robots

.include <bsd.port.mk>
