# $MidnightBSD$

PORTNAME=	geoclue
PORTVERSION=	2.4.3
PORTREVISION=	1
CATEGORIES=	net devel gnome
MASTER_SITES=	http://www.freedesktop.org/software/geoclue/releases/2.1/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	D-Bus service that provides location information

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libjson-glib-1.0.so:devel/json-glib \
		libsoup-2.4.so:devel/libsoup
	
USES=		gettext gnome gmake libtool localbase \
		pathfix pkgconfig tar:xz
USE_GNOME=	glib20 intlhack introspection:build
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--disable-3g-source \
		--disable-cdma-source \
		--disable-nmea-source \
		--disable-modem-gps-source
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
