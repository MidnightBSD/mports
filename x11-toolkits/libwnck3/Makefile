PORTNAME=	libwnck
PORTVERSION=	3.36.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	3
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library used for writing pagers and taskslists

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz

USES+=		bison gettext gnome localbase meson pkgconfig \
		xorg
USE_GNOME=	cairo gdkpixbuf gtk30  introspection:build
USE_XORG=	xext xrender xres x11
USE_LDCONFIG=	yes
MESON_ARGS=	-Dgtk_doc=false \
		-Dinstall_tools=false

OPTIONS_DEFINE=	STARTUP
OPTIONS_DEFAULT=STARTUP
STARTUP_DESC=	Startup notification support
STARTUP_LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification
STARTUP_MESON_ENABLED=	startup_notification

.include <bsd.port.mk>
