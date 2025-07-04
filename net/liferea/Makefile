PORTNAME=	liferea
DISTVERSION=	1.14.5
PORTREVISION=	1
CATEGORIES=	net gnome
MASTER_SITES=	https://github.com/lwindolf/liferea/releases/download/v${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple RSS/RDF feed reader
WWW=		https://lzone.de/liferea/

LICENSE=	gpl2

BUILD_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas
LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libharfbuzz.so:print/harfbuzz \
		libsoup-2.4.so:devel/libsoup \
		libwebkit2gtk-4.0.so:www/webkit2-gtk3 \
		libpeas-1.0.so:devel/libpeas \
		libjson-glib-1.0.so:devel/json-glib
RUN_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		${PYTHON_PKGNAMEPREFIX}libpeas>=0:devel/py-libpeas@${PY_FLAVOR}

USES=		compiler:c++11-lang cpe desktop-file-utils gettext \
		gmake gnome libtool localbase \
		pathfix pkgconfig python sqlite tar:bzip2
USE_GNOME=	cairo dconf:run gtk30 gdkpixbuf intltool introspection \
		libxslt libxml2

GLIB_SCHEMAS=	net.sf.liferea.gschema.xml

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection

# Introspection starts the program, but it may hang or crash-abort
# without an X server because the Webkit compositor tries to initialize
# a graphics backend
MAKE_ENV+=	WEBKIT_DISABLE_COMPOSITING_MODE=1

INSTALL_TARGET=	install-strip

NO_TEST=	yes

.include <bsd.port.mk>
