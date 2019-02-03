# $MidnightBSD$

PORTNAME=	purple-discord
PORTVERSION=	g20171227
CATEGORIES=	net-im

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Discord plugin for libpurple

LICENSE=	gpl3

LIB_DEPENDS=	libpurple.so:net-im/libpurple \
		libjson-glib-1.0.so:devel/json-glib

WRKSRC=		${WRKDIR}/purple-discord-9b7c3ad

USES=		dos2unix gettext gmake pkgconfig
USE_GNOME=	glib20
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	EionRobb
GH_TAGNAME=	9b7c3ad

DOS2UNIX_FILES=	Makefile

pre-patch: dos2unix

.include <bsd.port.mk>
