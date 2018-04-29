# $MidnightBSD$
# $FreeBSD: head/net-im/purple-facebook/Makefile 462014 2018-02-16 13:46:32Z swills $

PORTNAME=	purple-facebook
PORTVERSION=	0.9.5
CATEGORIES=	net-im
MASTER_SITES=	https://github.com/dequis/purple-facebook/releases/download/v${PORTVERSION}-${GITHASH}/
DISTNAME=	${PORTNAME}-${PORTVERSION}-${GITHASH}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Facebook plugin for libpurple

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libpurple.so:net-im/libpurple \
		libjson-glib-1.0.so:devel/json-glib

GITHASH=	9ff9acf9fa14
USES=		autoreconf libtool pkgconfig
PLIST_FILES=	lib/purple-2/libfacebook.so
GNU_CONFIGURE=	yes
USE_GNOME=	glib20
USE_LDCONFIG=	yes

.include <bsd.port.mk>
