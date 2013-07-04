# $MidnightBSD: mports/devel/libIDL/Makefile,v 1.5 2009/04/15 03:11:19 laffer1 Exp $

PORTNAME=	libIDL
PORTVERSION=	0.8.14
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library for creating trees of CORBA IDL files
LICENSE=        lgpl

USES=		pathfix pkgconfig gettext
USE_BZIP2=	yes
USE_GMAKE=	yes
USE_BISON=	build
USE_GNOME=	glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

INFO=		libIDL2

.include <bsd.port.mk>
