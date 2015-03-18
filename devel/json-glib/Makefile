# $MidnightBSD$

PORTNAME=	json-glib
PORTVERSION=	1.0.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib
LICENSE=	lgpl

USES=		gmake libtool pathfix pkgconfig tar:xz
USE_GNOME=	glib20 gnomeprefix introspection
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

.include <bsd.port.mk>
