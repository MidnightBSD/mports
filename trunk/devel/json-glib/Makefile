# $MidnightBSD: mports/devel/json-glib/Makefile,v 1.5 2011/05/11 13:51:01 laffer1 Exp $

PORTNAME=	json-glib
PORTVERSION=	0.14.2
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/share/gir-1.0/GLib-2.0.gir:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	${LOCALBASE}/share/gir-1.0/GLib-2.0.gir:${PORTSDIR}/devel/gobject-introspection

USES=		pkgconfig
USE_GMAKE=	yes
USE_XZ=		yes
USE_GNOME=	glib20 gnomehack gnomeprefix ltverhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
