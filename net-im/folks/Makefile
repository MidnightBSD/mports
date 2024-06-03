PORTNAME=	folks
PORTVERSION=	0.15.5
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to aggregates people from multiple sources
WWW=		https://wiki.gnome.org/Projects/Folks

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgee-0.8.so:devel/libgee \
		libgcr-base-3.so:security/gcr \
		libzeitgeist-2.0.so:sysutils/zeitgeist \
		libtelepathy-glib.so:net-im/telepathy-glib \
		libnspr4.so:devel/nspr \
		libssl3.so:security/nss \
		libsecret-1.so:security/libsecret \
		libsoup-2.4.so:devel/libsoup \
		libdbus-glib-1.so:devel/dbus-glib \
		libdbus-1.so:devel/dbus

USES=		gettext gnome localbase meson python:3.5+,build pkgconfig \
		readline sqlite tar:xz vala:build
USE_GNOME=	evolutiondataserver3 intlhack introspection:build
USE_LDCONFIG=	yes

NO_TEST=	yes

MESON_ARGS=	-Dbluez_backend=false

GLIB_SCHEMAS=	org.freedesktop.folks.gschema.xml

PLIST_SUB=	LIBVER=26 LIBVERLONG=26.0.0

BINARY_ALIAS=	python3=${PYTHON_CMD}

.include <bsd.port.mk>
