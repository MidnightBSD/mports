PORTNAME=	grilo
PORTVERSION=	0.3.15
CATEGORIES=	net
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework focused on making media discovery and browsing
WWW=		https://wiki.gnome.org/Grilo

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libsoup-2.4.so:devel/libsoup \
		liboauth.so:net/liboauth \
		libtotem-plparser.so:multimedia/totem-pl-parser

USES=		cpe gettext gnome localbase meson pathfix pkgconfig \
		python:build tar:xz vala:build
CPE_VENDOR=	gnome
USE_LDCONFIG=	yes
USE_GNOME=	glib20 introspection:build libxml2
BINARY_ALIAS=	python=${PYTHON_VERSION}

MESON_ARGS=	-Denable-gtk-doc=false -Dsoup3=false

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	UI

UI_DESC=	Enable testing UI
UI_MESON_TRUE=	enable-test-ui
UI_USE=		GNOME=cairo,gdkpixbuf,gtk30

PLIST_SUB+=	LIBVER=315

.include <bsd.port.mk>
