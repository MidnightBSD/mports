# $MidnightBSD: mports/net-im/meanwhile/Makefile,v 1.5 2009/09/20 01:48:09 laffer1 Exp $

PORTNAME=	meanwhile
PORTVERSION=	1.0.2
CATEGORIES=	net-im
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source implementation of the Lotus Sametime protocol
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool:22
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-doxygen=no \
		--with-gmp-prefix=${LOCALBASE}
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-doc-${PORTVERSION}

.include <bsd.port.mk>
