# Created by: Gustau Perez i Querol <gustau.perez@gmail.com>

PORTNAME=	cjs
PORTVERSION=	2.4.1
PORTREVISION=	6
CATEGORIES=	lang gnome
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JavaScript bindings based on gobject-introspection

LICENSE=	mpl lgpl gpl2
LICENSE_COMB=	multi

BUILD_DEPENDS=	gnome-autogen.sh:devel/gnome-common
LIB_DEPENDS=	libdbus-glib-1.so:devel/dbus-glib \
		libmozjs-24.so:lang/spidermonkey24

CONFLICTS_BUILD=spidermonkey17-1.7.*

USES=		autoreconf compiler:c11 gettext gmake gnome libtool pathfix \
		pkgconfig python:build shebangfix
USE_GNOME=	cairo glib20 gnomeprefix introspection:build
USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CFLAGS+=	-I${LOCALBASE}/include
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS+=--enable-compile-warnings=no

.include <bsd.port.mk>
