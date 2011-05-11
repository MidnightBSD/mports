# $MidnightBSD: mports/devel/json-glib/Makefile,v 1.4 2011/02/02 20:17:33 laffer1 Exp $

PORTNAME=	json-glib
PORTVERSION=	0.12.0
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/share/gir-1.0/GLib-2.0.gir:${PORTSDIR}/devel/gobject-introspection
RUN_DEPENDS=	${LOCALBASE}/share/gir-1.0/GLib-2.0.gir:${PORTSDIR}/devel/gobject-introspection

USE_GMAKE=	yes
USE_BZIP2=	yes
USE_GNOME=	glib20 gnomehack gnomeprefix ltverhack
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
