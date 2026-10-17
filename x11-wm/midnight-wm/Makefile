PORTNAME=	midnight-wm
PORTVERSION=	0.1.0
CATEGORIES=	x11-wm
MASTER_SITES=	https://github.com/MidnightBSD/midnight-wm/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Warp-inspired X11 desktop shell and window manager
WWW=		https://github.com/MidnightBSD/midnight-wm

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libxcb-icccm.so:x11/xcb-util-wm \
		libxcb-keysyms.so:x11/xcb-util-keysyms \
		libsqlite3.so:databases/sqlite3
RUN_DEPENDS=	${LOCALBASE}/libexec/gvfsd-trash:filesystems/gvfs

USES=		cmake:testing compiler:c++23-lang gnome localbase pkgconfig xorg
USE_GNOME=	cairo glib20 pango gdkpixbuf
USE_XORG=	xcb

.include <bsd.port.mk>
