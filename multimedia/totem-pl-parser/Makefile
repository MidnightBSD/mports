PORTNAME=	totem-pl-parser
PORTVERSION=	3.26.7
CATEGORIES=	multimedia gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject-based library to parse a host of playlist formats

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libgcrypt.so:security/libgcrypt

USES=		gettext-tools gnome libarchive localbase:ldflags meson pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build libxml2
USE_LDCONFIG=	yes

MESON_ARGS=	-Denable-uchardet=no

# Tests require live HTTP endpoints that are no longer reliable.
NO_TEST=	yes

.include <bsd.port.mk>
