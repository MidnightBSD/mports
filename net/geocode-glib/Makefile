PORTNAME=	geocode-glib
PORTVERSION=	3.26.4
CATEGORIES=	net devel gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenience library for the geocoding and reverse geocoding
WWW=		https://git.gnome.org/browse/geocode-glib

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libsoup-2.4.so:devel/libsoup

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes
MESON_ARGS=	-Denable-installed-tests=false -Dsoup2=true
#MAKE_ENV=	XDG_CACHE_HOME=${WRKDIR}

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	gtkdoc-scan:textproc/gtk-doc
DOCS_MESON_TRUE=	enable-gtk-doc
DOCSDIR=		${PREFIX}/share/gtk-doc/html/geocode-glib

NO_TEST=	yes

.include <bsd.port.mk>
