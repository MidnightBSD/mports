PORTNAME=	libdex
PORTVERSION=	1.1.0
PORTREVISION=	0
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library supporting Deferred Execution for GTK applications
WWW=		https://gitlab.gnome.org/GNOME/libdex

LICENSE=	lgpl2.1+

USES=		gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dexamples=false \
		-Dtests=false \
		-Dliburing=disabled

.include <bsd.port.mk>
