PORTNAME=	clutter-gtk
PORTVERSION=	1.8.4
PORTREVISION=	2
CATEGORIES=	graphics
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GTK Integration library for Clutter
WWW=		https://blogs.gnome.org/clutter/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcogl.so:graphics/cogl \
		libclutter-1.0.so:graphics/clutter \
		libjson-glib-1.0.so:devel/json-glib

USES=		gettext gl gnome localbase meson pkgconfig tar:xz xorg
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build
USE_XORG=	x11 xcomposite xdamage xext xfixes xi xrandr
USE_GL=		egl
USE_LDCONFIG=	yes

.include <bsd.port.mk>
