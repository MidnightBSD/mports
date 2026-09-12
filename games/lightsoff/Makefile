PORTNAME=	lightsoff
PORTVERSION=	50.0
PORTREVISION=	0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lights Off game for GNOME
WWW=		https://wiki.gnome.org/Lightsoff

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	itstool:textproc/itstool
PORTSCOUT=	limitw:1,even

USES=		desktop-file-utils gettext gnome localbase meson pkgconfig tar:xz vala:build
USE_GNOME=	cairo glib20 gtk40 libadwaita

INSTALLS_ICONS=	yes
GLIB_SCHEMAS=	org.gnome.LightsOff.gschema.xml

.include <bsd.port.mk>
