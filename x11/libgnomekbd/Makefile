PORTNAME=	libgnomekbd
PORTVERSION=	3.28.1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME keyboard shared library
WWW=		https://gitlab.gnome.org/GNOME/libgnomekbd

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libxklavier.so:x11/libxklavier

USES=		gettext gnome localbase meson pkgconfig \
		tar:xz xorg
USE_GNOME=	cairo gdkpixbuf glib20 gtk30 introspection:build
USE_XORG=	x11
USE_LDCONFIG=	yes

MESON_ARGS=	-Dtests=false \
		-Dvapi=false

GLIB_SCHEMAS=	org.gnome.libgnomekbd.desktop.gschema.xml \
		org.gnome.libgnomekbd.gschema.xml \
		org.gnome.libgnomekbd.keyboard.gschema.xml

.include <bsd.port.mk>
