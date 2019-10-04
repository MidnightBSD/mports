PORTNAME=	gom
PORTVERSION=	0.3.3
CATEGORIES=	databases gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject Data Mapper

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnome meson pkgconfig python:3.4+ sqlite tar:xz
USE_GNOME=	gdkpixbuf2 glib20 introspection pygobject3

USE_LDCONFIG=	yes

.include <bsd.port.mk>
