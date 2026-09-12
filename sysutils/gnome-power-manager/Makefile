PORTNAME=	gnome-power-manager
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	sysutils gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Power management system for the GNOME Desktop
WWW=		https://projects.gnome.org/gnome-power-manager

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libupower-glib.so:sysutils/upower

USES=		desktop-file-utils gettext-tools gnome localbase:ldflags meson \
		pkgconfig tar:xz
INSTALLS_ICONS=	yes
USE_GNOME=	cairo gtk40 gtk-update-icon-cache

PORTSCOUT=	limitw:1,even

GLIB_SCHEMAS=	org.gnome.power-manager.gschema.xml

OPTIONS_DEFINE=	MANPAGES
OPTIONS_SUB=	yes

MANPAGES_BUILD_DEPENDS=	docbook2html:textproc/docbook-utils \
			docbook-sgml>0:textproc/docbook-sgml

.include <bsd.port.mk>
