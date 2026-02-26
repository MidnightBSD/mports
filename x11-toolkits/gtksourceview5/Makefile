PORTNAME=	gtksourceview
DISTVERSION=	5.14.2
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

LIB_DEPENDS=	libfontconfig.so:x11-fonts/fontconfig \
		libfribidi.so:converters/fribidi \
		libpcre2-8.so:devel/pcre2

PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome meson pkgconfig tar:xz vala:build
USE_CSTD=	c11
USE_GNOME=	cairo gdkpixbuf gtk40 libxml2 introspection:build
USE_LDCONFIG=	yes

NO_TEST=	yes

.include <bsd.port.mk>
