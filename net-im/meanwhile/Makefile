# $MidnightBSD: mports/net-im/meanwhile/Makefile,v 1.8 2013/03/09 23:28:34 laffer1 Exp $

PORTNAME=	meanwhile
PORTVERSION=	1.0.2
PORTREVISION=	2
CATEGORIES=	net-im
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Source implementation of the Lotus Sametime protocol
LICENSE=	lgpl

USE_AUTOTOOLS=	libtool
USES=		pkgconfig
USE_GMAKE=	yes
USE_GNOME=	gnomehack glib20
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-doxygen=no \
		--with-gmp-prefix=${LOCALBASE}
CPPFLAGS+=	-I${LOCALBASE}/include -DGLIB_COMPILATION
LDFLAGS+=	-L${LOCALBASE}/lib

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME}-doc-${PORTVERSION}

post-patch:
	@${REINPLACE_CMD} -e 's|glib/.*\.h>|glib.h>|g' \
		${WRKSRC}/samples/*.c ${WRKSRC}/src/*.[ch]

.include <bsd.port.mk>
