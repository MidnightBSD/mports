# $MidnightBSD$

PORTNAME=	gnome-characters
PORTVERSION=	3.28.2
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	find and insert unusual characters for GNOME 3

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

LIB_DEPENDS=	libgjs.so:lang/gjs \
		libunistring.so:devel/libunistring \
		libdbus-1.so:devel/dbus

USES=		gettext gnome iconv:wchar_t localbase:ldflags meson \
		pkgconfig python:3.6+,build tar:xz
USE_GNOME=	gtk30 introspection
USE_LDCONFIG=	yes
INSTALLS_ICONS=	yes
BINARY_ALIAS=	python3=${PYTHON_VERSION}

GLIB_SCHEMAS=	org.gnome.Characters.gschema.xml

.include <bsd.port.mk>
