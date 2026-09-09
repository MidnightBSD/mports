PORTNAME=	atomix
PORTVERSION=	44.0
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Yet another little mind game
WWW=		https://wiki.gnome.org/Apps/Atomix

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext gnome meson pkgconfig tar:xz

BUILD_DEPENDS=	appstream-util:devel/appstream-glib
LIB_DEPENDS=	libgnome-games-support-1.so:games/libgnome-games-support

PORTSCOUT=	limitw:1,even

USE_GNOME=	cairo gdkpixbuf glib20 gtk30
LDFLAGS+=	-lm
INSTALLS_ICONS=	yes

.include <bsd.port.mk>
