PORTNAME=	libdazzle
DISTVERSION=	3.44.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Companion library to GObject and GTK
WWW=		https://gitlab.gnome.org/GNOME/libdazzle

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c11 gettext gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	cairo gdkpixbuf gtk30 introspection:build

#meson compat issues
NO_TEST=	yes

.include <bsd.port.mk>
