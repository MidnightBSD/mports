# $MidnightBSD$

PORTNAME=	json-glib
PORTVERSION=	0.6.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://folks.o-hand.com/~ebassi/sources/ \
    		${MASTER_SITE_LOCAL:S/$/:local/}
MASTER_SITE_SUBDIR=	marcus:local

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (RFC 4627) interface for Glib
LICENSE=	lgpl

USE_GMAKE=	yes
USE_GNOME=	glib20 gnomehack gnomeprefix ltverhack
USE_AUTOTOOLS=	libtool:15
USE_LDCONFIG=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.mk>
