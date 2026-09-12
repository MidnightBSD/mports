PORTNAME=	gjs
PORTVERSION=	1.86.0
PORTREVISION=	0
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Javascript binding
WWW=		https://gitlab.gnome.org/GNOME/gjs

LICENSE=	mit lgpl+
LICENSE_COMB=	dual
LICENSE_FILE_mit=	${WRKSRC}/LICENSES/MIT.txt
LICENSE_FILE_lgpl+ = ${WRKSRC}/LICENSES/LGPL-2.0-or-later.txt

BUILD_DEPENDS=	dbus-run-session:devel/dbus
LIB_DEPENDS=	libmozjs-140.so:lang/spidermonkey140 \
		libffi.so:devel/libffi

USES=		compiler:c++17-lang gettext gnome \
		localbase meson pkgconfig python:build readline tar:xz xorg
USE_GNOME=	cairo glib20 introspection
USE_XORG=	x11 xext
MESON_ARGS=	-Dreadline=enabled \
		-Dprofiler=disabled \
		-Dinstalled_tests=false \
		-Dgobject-introspection-tests:install_dir='' \
		-Dskip_dbus_tests=true \
		-Dskip_gtk_tests=true
USE_LDCONFIG=	yes

CONFIGURE_ENV=	PYTHONDONTWRITEBYTECODE=1
MAKE_ENV=	PYTHONDONTWRITEBYTECODE=1

NO_TEST=	yes

.include <bsd.port.mk>
