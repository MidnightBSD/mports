# $MidnightBSD$
# $FreeBSD: head/x11-toolkits/libdazzle/Makefile 480951 2018-09-30 11:58:29Z kwm $

PORTNAME=	libdazzle
PORTVERSION=	3.28.3
CATEGORIES=	x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Staging and stabilizing for facy Glib and Gtk+ features

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala

USES=		gnome meson pkgconfig tar:xz
USE_GNOME=	cairo gdkpixbuf2 gtk30 introspection:build

.include <bsd.port.mk>
