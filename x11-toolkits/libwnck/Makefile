PORTNAME=	libwnck
PORTVERSION=	2.30.7
PORTREVISION?=	2
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library used for writing pagers and taskslists

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:xz

PORTSCOUT=	ignore:1

USES+=		bison gettext gmake gnome libtool localbase:ldflags \
		pathfix pkgconfig xorg
USE_XORG=	xres x11
USE_GNOME=	gtk20 intlhack introspection
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	STARTUP
OPTIONS_DEFAULT=STARTUP
STARTUP_DESC=	Startup notification support
STARTUP_LIB_DEPENDS=	libstartup-notification-1.so:x11/startup-notification
STARTUP_CONFIGURE_ENABLE=	startup-notification

.include <bsd.port.mk>
