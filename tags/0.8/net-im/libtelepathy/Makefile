# $MidnightBSD$

PORTNAME=	libtelepathy
PORTVERSION=	0.3.3
PORTREVISION=	2
CATEGORIES=	net-im devel
MASTER_SITES=	http://telepathy.freedesktop.org/releases/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible Communications Framework

LICENSE=	lgpl

LIB_DEPENDS=	libtelepathy-glib.so:${PORTSDIR}/net-im/telepathy-glib \
		libdbus-glib-1.so:${PORTSDIR}/devel/dbus-glib

USES=		gmake libtool pathfix pkgconfig python:build
USE_LDCONFIG=	yes
USE_GNOME=	glib20 libxslt:build
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lglib-2.0 `pkg-config --libs telepathy-glib`
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
