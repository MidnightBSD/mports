# $MidnightBSD$

PORTNAME=	atk
PORTVERSION=	2.28.1
PORTREVISION?=	0
CATEGORIES=	accessibility devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME accessibility toolkit (ATK)

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

USE_LDCONFIG=	yes
USES=		gettext gnome localbase meson pkgconfig tar:xz
USE_GNOME=	glib20 introspection:build

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${CP} ${PREFIX}/lib/pkgconfig/* ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
