PORTNAME=	gtksourceview
PORTVERSION=	5.4.1
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	5
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text widget that adds syntax highlighting to the GtkTextView widget
WWW=		https://wiki.gnome.org/Projects/GtkSourceView

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libpcre2-8.so:devel/pcre2

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome meson pkgconfig tar:xz vala:build
USE_CSTD=	c11
USE_GNOME=	cairo gdkpixbuf gtk40 introspection:build libxml2
USE_LDCONFIG=	yes

NO_TEST=	yes

.include <bsd.port.mk>
