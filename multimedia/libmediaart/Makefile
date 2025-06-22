PORTNAME=	libmediaart
DISTVERSION=	1.9.6
CATEGORIES=	multimedia devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for handling media art
WWW=		https://www.gnome.org/

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	dual

USES=		gnome meson pathfix pkgconfig tar:xz vala:build
USE_GNOME=	gdkpixbuf introspection:build
USE_LDCONFIG=	yes

MESON_ARGS=	-Dimage_library=gdk-pixbuf -Dgtk_doc=false

.include <bsd.port.mk>
