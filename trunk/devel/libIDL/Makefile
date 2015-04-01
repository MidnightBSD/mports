# $MidnightBSD$

PORTNAME=	libIDL
PORTVERSION=	0.8.14
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for creating trees of CORBA IDL files

LICENSE=        lgpl

USES=		pathfix pkgconfig libtool:keepla gettext gmake tar:bzip2
USE_BISON=	build
USE_GNOME=	glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-html-dir=${PREFIX}/share/doc
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

INFO=		libIDL2

.include <bsd.port.mk>
