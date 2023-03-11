PORTNAME=	libgnome-games-support
DISTVERSION=	1.8.2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small library intended for internal use by GNOME Games
WWW=		https://git.gnome.org/browse/libgnome-games-support

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgee-0.8.so:devel/libgee

PORTSCOUT=	limitw:1,even

USES=		gettext gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf2 gtk30

NO_TEST=	yes

.include <bsd.port.mk>
