# $MidnightBSD$

PORTNAME=	gdl
PORTVERSION=	3.18.0
CATEGORIES=	x11-toolkits gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Components intended to be shared between GNOME development tools

LICENSE=	lgpl
LICENSE_FILE=	${WRKSRC}/COPYING

USE_GNOME=	gnomeprefix gtk30 intlhack introspection:build
USES=		gettext gmake libtool pathfix pkgconfig tar:xz
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
