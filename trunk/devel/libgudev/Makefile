# $MidnightBSD$

PORTNAME=	libgudev
PORTVERSION=	230
CATEGORIES=	devel
MASTER_SITES=	https://download.gnome.org/sources/libgudev/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject bindings for libudev.

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libudev.so:devel/libudev-devd

USES=		gettext-runtime gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
