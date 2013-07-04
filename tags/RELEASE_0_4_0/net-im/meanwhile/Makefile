# $MidnightBSD: mports/net-im/meanwhile/Makefile,v 1.7 2011/02/02 21:16:29 laffer1 Exp $

PORTNAME=	meanwhile
PORTVERSION=	1.0.2
PORTREVISION=	1
CATEGORIES=	net-im
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source implementation of the Lotus Sametime protocol
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-doxygen=no \
		--with-gmp-prefix=${LOCALBASE}
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-doc-${PORTVERSION}

.include <bsd.port.mk>
