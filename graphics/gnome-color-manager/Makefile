PORTNAME=	gnome-color-manager
PORTVERSION=	3.36.0
PORTREVISION=	2
CATEGORIES=	graphics gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session framework for the GNOME desktop to manage color profiles
WWW=		https://git.gnome.org/browse/gnome-color-manager

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

DEPRECATED=	Depends on expired textproc-docbook-utils
EXPIRATION_DATE=2025-08-21

BUILD_DEPENDS=	docbook2man:textproc/docbook-utils \
		itstool:textproc/itstool \
		docbook-sgml>0:textproc/docbook-sgml
LIB_DEPENDS=	liblcms2.so:graphics/lcms2 \
		libcolord.so:graphics/colord \
		libcolord-gtk.so:graphics/colord-gtk \
		libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libtiff.so:graphics/tiff \
		libexif.so:graphics/libexif

PORTSCOUT=	limitw:1,even

USES=		compiler:c++11-lang desktop-file-utils gettext gnome meson \
		pkgconfig tar:xz
USE_GNOME=	cairo gtk30 vte3
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
MESON_ARGS=	-Dtests=false

.include <bsd.port.mk>
