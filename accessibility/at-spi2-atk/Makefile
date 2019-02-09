# $MidnightBSD$

PORTNAME=	at-spi2-atk
PORTVERSION=	2.26.2
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assisted Technology Provider module for GTK+

LICENSE=	lgpl2.1

BUILD_DEPENDS=	at-spi2-core>=2.17.90:accessibility/at-spi2-core
LIB_DEPENDS=	libdbus-1.so:devel/dbus
RUN_DEPENDS=	at-spi2-core>=2.17.90:accessibility/at-spi2-core

PORTSCOUT=	limitw:1,even

USES=		cpe gettext-runtime gnome localbase meson pkgconfig tar:xz
USE_GNOME=	atk glib20 intlhack
USE_LDCONFIG=	yes
CPE_VENDOR=	gnome

post-install:
	${MKDIR} ${PREFIX}/libdata/pkgconfig
	${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig/

.include <bsd.port.mk>
