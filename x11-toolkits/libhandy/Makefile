PORTNAME=	libhandy
PORTVERSION=	1.6.2
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library with GTK+ widgets for mobile phones
WWW=		https://gitlab.gnome.org/GNOME/libhandy/

LICENSE=	lgpl2.1

LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libgladeui-2.so:devel/glade

USES=		compiler:c11 gettext gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build

USE_LDCONFIG=	yes
MESON_ARGS=	-Dtests=false

.include <bsd.port.mk>
