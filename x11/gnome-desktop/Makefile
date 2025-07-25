PORTNAME=	gnome-desktop
PORTVERSION=	44.1
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME
WWW=		https://www.gnome.org/

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi

PORTSCOUT=	limitw:1,even

BUILD_DEPENDS=	iso-codes>=0:misc/iso-codes \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		xkeyboard-config>=0:x11/xkeyboard-config \
		itstool:textproc/itstool
RUN_DEPENDS=	iso-codes>=0:misc/iso-codes \
		gsettings-desktop-schemas>=0:devel/gsettings-desktop-schemas \
		cantarell-fonts>=0:x11-fonts/cantarell-fonts \
		xkeyboard-config>=0:x11/xkeyboard-config

USES=		bison cpe gettext gnome localbase:ldflags meson \
		pkgconfig python tar:xz xorg
USE_GNOME=	cairo gdkpixbuf gtk30 gtk40 intltool introspection:build
USE_XORG=	x11
USE_LDCONFIG=	yes
MESON_ARGS=	-Dudev=disabled \
		-Dsystemd=disabled \
		-Dgtk_doc=false
CPE_VENDOR=	gnome

.include <bsd.port.mk>
