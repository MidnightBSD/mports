PORTNAME=	libgnome-games-support
DISTVERSION=	2.0.2
CATEGORIES=	games gnome
MASTER_SITES=	GNOME
PKGNAMESUFFIX=	2
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small library intended for internal use by GNOME Games
WWW=		https://gitlab.gnome.org/GNOME/libgnome-games-support

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libgee-0.8.so:devel/libgee

USES=		gettext-tools gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 gtk40
USE_LDCONFIG=	yes

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

.include <bsd.port.mk>
