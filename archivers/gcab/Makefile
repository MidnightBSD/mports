PORTNAME=	gcab
PORTVERSION=	1.5
CATEGORIES=	archivers gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject library to create cabinet files

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe gettext gnome meson pkgconfig tar:xz vala:build
USE_GNOME=	glib20 introspection:build
CPE_VENDOR=	gnome

MESON_ARGS=	-Ddocs=false

.include <bsd.port.mk>
