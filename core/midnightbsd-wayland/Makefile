PORTNAME=	midnightbsd-wayland
PORTVERSION=	1.0
CATEGORIES=	core wayland
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	MidnightBSD Wayland session environment
WWW=		https://www.midnightbsd.org/

LICENSE=	agg

RUN_DEPENDS=	dbus-daemon:devel/dbus \
		foot:x11/foot \
		grim:x11/grim \
		seatd:sysutils/seatd \
		slurp:x11/slurp \
		sway:x11-wm/sway \
		wayland>=0:graphics/wayland \
		wayland-info:graphics/wayland-utils \
		wayland-protocols>=0:graphics/wayland-protocols \
		wofi:x11/wofi \
		xdg-desktop-portal-wlr>=0:x11/xdg-desktop-portal-wlr \
		xdg-utils>=0:devel/xdg-utils \
		xwayland>=0:x11-servers/xwayland \
		libinput>=0:x11/libinput \
		libxkbcommon>=0:x11/libxkbcommon

USES=		metaport

.include <bsd.port.mk>
