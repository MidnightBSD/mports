PORTNAME=	cinnamon-session
PORTVERSION=	4.8.0
PORTREVISION=	1
CATEGORIES=	x11 gnome
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Session component for the cinnamon desktop

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libdbus-glib-1.so:devel/dbus-glib \
		libxapp.so:x11/xapp \
		libcanberra.so:audio/libcanberra
RUN_DEPENDS=	console-kit-daemon:sysutils/consolekit2

USES=		gl gnome meson pkgconfig python:3.5+,build shebangfix xorg

USE_GITHUB=	yes
GH_ACCOUNT=	linuxmint

SHEBANG_FILES=	data/meson_install_schemas.py

USE_GNOME=	cairo gdkpixbuf gtk30
USE_XORG=	ice sm x11 xau xcomposite xext xrender xtrans xtst
USE_GL=		gl
INSTALLS_ICONS=	yes

GLIB_SCHEMAS=	org.cinnamon.SessionManager.gschema.xml

OPTIONS_DEFINE=	DOCS GCONF IPV6
OPTIONS_DEFAULT=	IPV6

DOCS_BUILD_DEPENDS=	xmlto:textproc/xmlto
DOCS_MESON_TRUE=	docbook

GCONF_USE=		gnome=gconf2
GCONF_MESON_TRUE=	gconf

IPV6_MESON_TRUE=	ipv6

.include <bsd.port.mk>
