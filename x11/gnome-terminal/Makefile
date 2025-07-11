PORTNAME=	gnome-terminal
DISTVERSION=	3.44.2
PORTREVISION=	1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Terminal component for the GNOME Desktop
WWW=		https://www.gnome.org/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	docbook-xsl>0:textproc/docbook-xsl \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		itstool:textproc/itstool \
		xsltproc:textproc/libxslt
LIB_DEPENDS=	libfribidi.so:converters/fribidi \
		libgnutls.so:security/gnutls \
		libpcre2-8.so:devel/pcre2 \
		libuuid.so:misc/e2fsprogs-libuuid
RUN_DEPENDS=	gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas

PORTSCOUT=	limitw:1,even

USES=		cpe gettext gnome localbase meson pathfix pkgconfig python \
		tar:bz2 vala:build xorg
USE_GNOME=	cairo dconf gdkpixbuf gtk30 intltool vte3
USE_XORG=	x11
CPE_VENDOR=	gnome

GLIB_SCHEMAS=	org.gnome.Terminal.gschema.xml

BINARY_ALIAS=	python3=${PYTHON_CMD}

OPTIONS_DEFINE=		NAUTILUS SEARCHPROVIDER
OPTIONS_DEFAULT=	NAUTILUS SEARCHPROVIDER
OPTIONS_SUB=		yes

SEARCHPROVIDER_DESC=		GNOME Shell search provider
SEARCHPROVIDER_MESON_TRUE=	search_provider
SEARCHPROVIDER_BUILD_DEPENDS=	gnome-shell:x11/gnome-shell
SEARCHPROVIDER_RUN_DEPENDS=	gnome-shell:x11/gnome-shell

NAUTILUS_MESON_TRUE=	nautilus_extension
NAUTILUS_USE=		GNOME=nautilus3
NAUTILUS_DESC=		Open in terminal extension for nautilus

post-install:
	${RM} -r ${STAGEDIR}${PREFIX}/lib/systemd

.include <bsd.port.mk>
