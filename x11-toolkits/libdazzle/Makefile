PORTNAME=	libdazzle
PORTVERSION=	3.33.4
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Staging and stabilizing for facy Glib and Gtk+ features

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala

USES=		compiler:c11 gnome meson pkgconfig tar:xz
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection:build

#meson compat issues
NO_TEST=	yes

.include <bsd.port.mk>
