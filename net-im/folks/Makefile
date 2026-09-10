PORTNAME=	folks
PORTVERSION=	0.15.12
CATEGORIES=	net-im
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to aggregates people from multiple sources
WWW=		https://wiki.gnome.org/Projects/Folks

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		gettext-tools gnome localbase meson python:build pkgconfig \
		readline tar:xz vala:build
USE_GNOME=	glib20 evolutiondataserver3 introspection:build libxml2
USE_LDCONFIG=	yes

MESON_ARGS=	-Dbluez_backend=false \
		-Dtelepathy_backend=false \
		-Dtests=false

GLIB_SCHEMAS=	org.freedesktop.folks.gschema.xml

PLIST_SUB=	LIBVER=26 LIBVERLONG=26.0.0

BINARY_ALIAS=	python3=${PYTHON_CMD}
.include <bsd.port.mk>
