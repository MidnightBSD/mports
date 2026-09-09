PORTNAME=	gom
PORTVERSION=	0.5.6
CATEGORIES=	databases gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject Data Mapper
WWW=		https://wiki.gnome.org/Projects/Gom

LICENSE=	lgpl2.1+
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gnome meson pkgconfig python sqlite tar:xz
USE_GNOME=	gdkpixbuf glib20 introspection pygobject3

USE_LDCONFIG=	yes

BINARY_ALIAS=	python3=${PYTHON_CMD}

.include <bsd.port.mk>
