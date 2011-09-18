# $MidnightBSD$
# $FreeBSD: ports/devel/libgdata/Makefile,v 1.12 2010/12/12 10:52:35 kwm Exp $

PORTNAME=	libgdata
PORTVERSION=	0.6.6
CATEGORIES=	devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GLib based implimentation of the GData protocol
LICENSE=	lgpl

BUILD_DEPENDS=	g-ir-scanner:${PORTSDIR}/devel/gobject-introspection
LIB_DEPENDS=	soup-gnome-2.4.1:${PORTSDIR}/devel/libsoup-gnome

USE_BZIP2=	yes
USE_LDCONFIG=	yes
USE_GETTEXT=	yes
USE_GMAKE=	yes
MAKE_JOBS_SAFE=	yes
USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack intltool ltverhack glib20
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include " \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS+=--with-html-dir="${PREFIX}/share/doc"

.include <bsd.port.mk>
