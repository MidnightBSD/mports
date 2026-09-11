PORTNAME=	gweather-locations
DISTVERSION=	2026.2
CATEGORIES=	net gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Locations database for libgweather
WWW=		https://gitlab.gnome.org/GNOME/gweather-locations

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gnome meson pkgconfig python:build shebangfix tar:xz
USE_GNOME=	pygobject3

SHEBANG_FILES=	build-aux/gen_locations_variant.py

BINARY_ALIAS=	python3=${PYTHON_VERSION}

.include <bsd.port.mk>
