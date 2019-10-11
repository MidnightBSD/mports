PORTNAME=	libgsf
PORTVERSION=	1.14.44
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Extensible i/o abstraction for dealing with structured file formats

LICENSE=	gpl2

USES=		gettext gmake gnome jpeg libtool localbase pathfix pkgconfig tar:xz
USE_GNOME=	gdkpixbuf2 glib20 intlhack introspection:build libxml2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CONFIGURE_ARGS=	--enable-introspection

.include <bsd.port.mk>
