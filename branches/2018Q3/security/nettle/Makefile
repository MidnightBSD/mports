# $MidnightBSD$

PORTNAME=	nettle
PORTVERSION=	3.4
CATEGORIES=	security
MASTER_SITES=	GNU \
		http://www.lysator.liu.se/~nisse/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level cryptographic library

LICENSE=	lgpl2.1

LIB_DEPENDS=	libgmp.so:math/gmp

USES=		gmake makeinfo ssl
GNU_CONFIGURE=	yes
CONFIGURE_ENV+=	M4="/usr/bin/m4 -g"
CONFIGURE_ARGS=	--enable-shared
MAKE_ARGS=	pkgconfigdir="${PREFIX}/libdata/pkgconfig"

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

INFO=		nettle
PORTDOCS=	NEWS README TODO nettle.html nettle.pdf
PORTEXAMPLES=	*.c *.h

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -e '/libdir=/ s|lib32|lib|' ${WRKSRC}/configure

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
