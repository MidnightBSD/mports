PORTNAME=	libgee
PORTVERSION=	0.20.3
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject collection library

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	valac:lang/vala

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-introspection=yes
USES=		cpe gettext gmake gnome libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip
CPE_VENDOR=	gnome

.include <bsd.port.mk>
