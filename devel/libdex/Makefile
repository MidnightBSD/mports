PORTNAME=	libdex
PORTVERSION=	0.10.1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library supporting Deferred Execution for GTK applications
WWW=		https://gitlab.gnome.org/GNOME/libdex

LICENSE=	lgpl2.1

USES=		gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dexamples=false \
		-Dtests=false

.include <bsd.port.mk>
