PORTNAME=	gom
PORTVERSION=	0.4
PORTREVISION=	2
CATEGORIES=	databases gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject Data Mapper
WWW=		https://wiki.gnome.org/Projects/Gom

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnome meson pkgconfig python sqlite tar:xz
USE_GNOME=	gdkpixbuf glib20 introspection pygobject3

USE_LDCONFIG=	yes

NO_TEST=	yes

.include <bsd.port.mk>
