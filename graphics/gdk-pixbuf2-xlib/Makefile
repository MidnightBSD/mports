PORTNAME=	gdk-pixbuf-xlib
PORTVERSION=	2.40.2
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	deprecated API for integrating Xlib and GdkPixbuf
WWW=		https://developer.gnome.org/gdk-pixbuf/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	docbook-xsl>0:textproc/docbook-xsl

USES=		cpe gettext gnome localbase:ldflags meson pkgconfig \
		python:build shared-mime-info tar:xz xorg
CPE_VENDOR=	gnome
USE_GNOME=	glib20 introspection:build libxslt:build gdkpixbuf
USE_XORG=	x11
USE_LDCONFIG=	yes

BINARY_ALIAS=	python3=${PYTHON_VERSION}

.include <bsd.port.mk>
