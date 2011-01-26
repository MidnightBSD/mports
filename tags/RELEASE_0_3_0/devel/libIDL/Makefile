# $MidnightBSD: mports/devel/libIDL/Makefile,v 1.4 2008/06/01 21:14:09 laffer1 Exp $

PORTNAME=	libIDL
PORTVERSION=	0.8.13
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for creating trees of CORBA IDL files
LICENSE=        lgpl

USE_BZIP2=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

INFO=		libIDL2

.include <bsd.port.mk>
