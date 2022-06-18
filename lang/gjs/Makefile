# Created by: Pawel Worach <pawel.worach@gmail.com>

PORTNAME=	gjs
PORTVERSION=	1.70.0
CATEGORIES=	lang gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

PATCH_SITES=	https://gitlab.gnome.org/GNOME/${PORTNAME}/-/commit/
PATCHFILES+=	59bbb5e4795d.patch:-p1 # https://gitlab.gnome.org/GNOME/gjs/-/merge_requests/694

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME Javascript binding

LICENSE=	mpl gpl2 lgpl2.1 mit
LICENSE_COMB=	multi

BUILD_DEPENDS+=	cmake:devel/cmake
LIB_DEPENDS=	libmozjs-78.so:lang/spidermonkey78 \
		libffi.so:devel/libffi

USES=		compiler:c++11-lib gettext gnome libtool \
		localbase meson pathfix pkgconfig python:build readline tar:xz xorg
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection
USE_XORG=	x11 xext
MESON_ARGS=	-Dcairo=enabled \
		-Dreadline=enabled \
		-Dprofiler=disabled \
		-Dinstalled_tests=false \
		-Denable_tests=false
USE_LDCONFIG=	yes

CONFIGURE_ENV=	PYTHONDONTWRITEBYTECODE=1
MAKE_ENV=	PYTHONDONTWRITEBYTECODE=1

.if !defined(MAGUS)
USE_GCC=	10+
.endif

.include <bsd.port.mk>
