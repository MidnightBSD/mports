PORTNAME=	libdbusmenu
PORTVERSION=	16.04.0
PORTREVISION=	4
CATEGORIES=	devel
MASTER_SITES=	https://launchpadlibrarian.net/243440794/ \
	https://launchpad.net/${PORTNAME}/${PORTVERSION:R}/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib and Gtk Implementation of the DBusMenu protocol
WWW=		https://launchpad.net/libdbusmenu

LICENSE=	gpl3 lgpl3 lgpl2.1
LICENSE_COMB=	multi

LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libharfbuzz.so:print/harfbuzz

GNU_CONFIGURE=	yes
USES=		compiler gettext-tools:build,run gmake gnome libtool pathfix \
		pkgconfig python:run shebangfix vala:build xorg
USE_GNOME=	cairo gdkpixbuf glib20 intltool intlhack libxslt \
		introspection:build gtk30
USE_XORG=	x11
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

SHEBANG_FILES=	tools/dbusmenu-bench

PLIST_SUB=	VERSION="0.4"

CONFIGURE_ARGS=	--disable-static \
	--disable-static \
	--disable-dumper \
	--disable-tests \
	--disable-massivedebugging \
	--enable-introspection=yes \
	--disable-nls \
	--enable-vala \
	--with-gtk=3

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	gtkdoc-check:textproc/gtk-doc
DOCS_CONFIGURE_ENABLE=	gtk-doc
DOCSDIR=		${PREFIX}/share/gtk-doc/html/

.include <bsd.port.pre.mk>

.if ${CHOSEN_COMPILER_TYPE} == gcc
CFLAGS+=	-Wno-unused-value
.endif

.include <bsd.port.post.mk>
