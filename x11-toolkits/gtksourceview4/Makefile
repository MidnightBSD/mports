PORTNAME=	gtksourceview
PORTVERSION=	4.8.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	4
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text widget that adds syntax highlighting to the GtkTextView widget
WWW=		https://wiki.gnome.org/Projects/GtkSourceView

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	vala:lang/vala
LIB_DEPENDS=	libfribidi.so:converters/fribidi

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome meson pkgconfig tar:xz
USE_CSTD=	c11
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build libxml2
USE_LDCONFIG=	yes

# magus
NO_TEST=	yes

.include <bsd.port.mk>
