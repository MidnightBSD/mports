# $MidnightBSD$

PORTNAME=	atk
PORTVERSION=	2.28.1
PORTREVISION?=	1
CATEGORIES=	accessibility devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME accessibility toolkit (ATK)

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

PORTSCOUT=	limitw:1,even

USE_LDCONFIG=	yes
USES=		gettext gnome localbase meson pkgconfig tar:xz python:build
USE_GNOME=	glib20 introspection:build

.include <bsd.port.mk>
