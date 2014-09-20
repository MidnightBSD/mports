# $MidnightBSD$

PORTNAME=	libgnome-keyring
PORTVERSION=	2.32.0
PORTREVISION=	5
CATEGORIES=	security gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Program that keeps passwords and other secrets

LICENSE=	gpl2

LIB_DEPENDS=	libtasn1.so:${PORTSDIR}/security/libtasn1 \
		libgcrypt.so:${PORTSDIR}/security/libgcrypt

USES=		gettext gmake libtool:keepla pathfix pkgconfig tar:bzip2
USE_GNOME=	gnomeprefix intlhack gconf2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
