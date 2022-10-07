# Created by: Pawel Worach <pawel.worach@gmail.com>

PORTNAME=	gjs
PORTVERSION=	1.72.0
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Javascript binding

LICENSE=	mpl gpl2 lgpl2.1 mit
LICENSE_COMB=	multi

BUILD_DEPENDS+=	cmake:devel/cmake \
		dbus-run-session:devel/dbus
LIB_DEPENDS=	libmozjs-91.so:lang/spidermonkey91 \
		libffi.so:devel/libffi

USES=		compiler:c++11-lib gettext gnome libtool \
		localbase meson pathfix pkgconfig python:build readline tar:xz xorg
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection
USE_XORG=	x11 xext
MESON_ARGS=	-Dcairo=enabled \
		-Dreadline=enabled \
		-Dprofiler=disabled \
		-Dinstalled_tests=false \
		-Dskip_dbus_tests=true \
		-Dskip_gtk_tests=true
USE_LDCONFIG=	yes

CONFIGURE_ENV=	PYTHONDONTWRITEBYTECODE=1
MAKE_ENV=	PYTHONDONTWRITEBYTECODE=1

.include <bsd.port.mk>
