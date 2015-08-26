# Created by: kwm@FreeBSD.org
# $MidnightBSD$

PORTNAME=	gcab
PORTVERSION=	0.6
CATEGORIES=	archivers gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GObject library to create cabinet files

LICENSE=	lgpl2.1

BUILD_DEPENDS=	vala:${PORTSDIR}/lang/vala

USES=		cpe gettext gmake libtool pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_GNOME=	glib20 intlhack introspection:build
CPE_VENDOR=	gnome

.include <bsd.port.mk>
