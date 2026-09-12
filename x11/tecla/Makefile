PORTNAME=	tecla
PORTVERSION=	48.0.2
PORTREVISION=	0
CATEGORIES=	x11 gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Keyboard layout viewer for the GNOME desktop
WWW=		https://gitlab.gnome.org/GNOME/tecla

LICENSE=	gpl2+

LIB_DEPENDS=	libxkbcommon.so:x11/libxkbcommon \
		libwayland-client.so:graphics/wayland

USES=		gettext gnome meson pkgconfig tar:xz
USE_GNOME=	glib20 gtk40 gtk-update-icon-cache libadwaita
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
