PORTNAME=	purple-facebook
PORTVERSION=	0.9.6
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	https://github.com/dequis/purple-facebook/releases/download/v${PORTVERSION}/

DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Facebook plugin for libpurple
WWW=		https://github.com/dequis/purple-facebook

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpurple.so:net-im/libpurple \
		libjson-glib-1.0.so:devel/json-glib

USES=		autoreconf gnome libtool pkgconfig
PLIST_FILES=	lib/purple-2/libfacebook.so
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
USE_LDCONFIG=	yes

.include <bsd.port.mk>
