PORTNAME=	gnome-screenshot
PORTVERSION=	41.0
PORTREVISION=	3
CATEGORIES=	deskutils gnome
MASTER_SITES=	GNOME/sources/${PORTNAME}/${PORTVERSION:C/^([0-9]+)\..*/\1/}
DIST_SUBDIR=	gnome

PATCH_SITES=	https://gitlab.gnome.org/GNOME/${PORTNAME}/-/commit/
PATCHFILES+=	b60dad3c2536.patch:-p1 # https://gitlab.gnome.org/GNOME/gnome-screenshot/-/merge_requests/57

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME utility for making pictures of your screen
WWW=		https://gitlab.gnome.org/GNOME/gnome-screenshot

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	appstream-builder:devel/appstream-glib
LIB_DEPENDS=	libcanberra.so:audio/libcanberra \
		libcanberra-gtk3.so:audio/libcanberra-gtk3 \
		libhandy-1.so:x11-toolkits/libhandy

CONFLICTS=	gnome-utils-2.[0-9]*
PORTSCOUT=	limitw:1,even

USES=		compiler:c11 gettext gnome meson pkgconfig python:build \
		shebangfix tar:xz xorg
USE_GNOME=	cairo gdkpixbuf gtk30
USE_XORG=	x11 xext
SHEBANG_FILES=	build-aux/postinstall.py

GLIB_SCHEMAS=	org.gnome.gnome-screenshot.gschema.xml

OPTIONS_DEFINE=	INTEL_FIX
OPTIONS_SUB=	yes

# Workaround garbled screenshot when 3D hardware acceleration is enabled
# via x11-drivers/xf86-video-intel port
INTEL_FIX_DESC=		Don't try to use the gnome-shell interface
INTEL_FIX_EXTRA_PATCHES+=	${FILESDIR}/extra-patch-intel

NO_TEST=	yes

.include <bsd.port.mk>
