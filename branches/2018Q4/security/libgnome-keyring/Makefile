# $MidnightBSD$

PORTNAME=	libgnome-keyring
PORTVERSION=	3.12.0
PORTREVISION=	2
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program that keeps passwords and other secrets

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-1.so:${PORTSDIR}/devel/dbus \
		libgcrypt.so:${PORTSDIR}/security/libgcrypt

USE_GNOME=	glib20 gnomeprefix intlhack \
		introspection:build
USES=		gettext gmake libtool pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-vala
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
