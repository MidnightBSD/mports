# $MidnightBSD$

PORTNAME=	at-spi2-core
PORTVERSION=	2.16.0
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assistive Technology Service Provider Interface

LICENSE=	lgpl2.1

LIB_DEPENDS=	libdbus-1.so:${PORTSDIR}/devel/dbus

USES=		gettext gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 intlhack introspection:build
USE_XORG=	x11 xi xtst xext
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-xevie
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
