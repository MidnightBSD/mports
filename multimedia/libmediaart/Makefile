PORTNAME=	libmediaart
DISTVERSION=	1.9.7
CATEGORIES=	multimedia devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for handling media art
WWW=		https://www.gnome.org/

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	dual

USES=		gnome meson pathfix pkgconfig tar:xz vala:build
USE_GNOME=	glib20 gdkpixbuf introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dimage_library=gdk-pixbuf

.include <bsd.port.mk>
