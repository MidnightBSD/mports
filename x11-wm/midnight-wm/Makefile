PORTNAME=	midnight-wm
PORTVERSION=	0.1.3
CATEGORIES=	x11-wm
MASTER_SITES=	https://github.com/MidnightBSD/midnight-wm/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Warp-inspired X11 desktop shell and window manager
WWW=		https://github.com/MidnightBSD/midnight-wm

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libgarcon-1.so:sysutils/garcon \
		libsqlite3.so:databases/sqlite3
BUILD_RUN_DEPENDS=	dbus-run-session:devel/dbus
RUN_DEPENDS=	picom:x11-wm/picom \
		${LOCALBASE}/libexec/gvfsd-trash:filesystems/gvfs \
		${LOCALBASE}/libexec/xdg-desktop-portal:deskutils/xdg-desktop-portal \
		${LOCALBASE}/libexec/xdg-desktop-portal-gtk:x11/xdg-desktop-portal-gtk \
		${LOCALBASE}/share/backgrounds/midnightbsd/mnbsd_bg_purple.png:x11-themes/midnightbsd-backgrounds

USES=		cmake:testing compiler:c++23-lang gnome localbase pkgconfig xorg
USE_GNOME=	cairo glib20 pango gdkpixbuf gtk30 librsvg2:run
USE_XORG=	xcb

OPTIONS_DEFINE=	XSCREENSAVER
OPTIONS_DEFAULT=	XSCREENSAVER
XSCREENSAVER_DESC=	Keep XScreenSaver idle while applications inhibit idle

XSCREENSAVER_RUN_DEPENDS=	xscreensaver-command:x11/xscreensaver

.include <bsd.port.mk>
