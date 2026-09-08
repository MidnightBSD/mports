PORTNAME=	gnome-desktop
PORTVERSION=	44.5
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Additional UI API for GNOME
WWW=		https://gitlab.gnome.org/GNOME/gnome-desktop

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi

BUILD_DEPENDS=	iso-codes>0:misc/iso-codes \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		xkeyboard-config>0:x11/xkeyboard-config
LIB_DEPENDS=	libxkbregistry.so:x11/libxkbcommon \
		libudev.so:devel/libudev-devd
RUN_DEPENDS=	iso-codes>0:misc/iso-codes \
		gsettings-desktop-schemas>0:devel/gsettings-desktop-schemas \
		cantarell-fonts>0:x11-fonts/cantarell-fonts \
		source-code-pro-ttf>0:x11-fonts/source-code-pro-ttf \
		xkeyboard-config>0:x11/xkeyboard-config

USES=		cpe gettext-tools gnome localbase:ldflags meson \
		pkgconfig tar:xz xorg
USE_GNOME=	cairo gdkpixbuf gtk30 gtk40 introspection:build
USE_XORG=	x11
USE_LDCONFIG=	yes
MESON_ARGS=	-Dudev=enabled \
		-Dsystemd=disabled \
		-Ddebug_tools=false \
		-Ddesktop_docs=false
CPE_VENDOR=	gnome

.include <bsd.port.mk>
