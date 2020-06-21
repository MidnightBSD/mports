PORTNAME=	nettle
PORTVERSION=	3.6
CATEGORIES=	security
MASTER_SITES=	GNU \
		https://www.lysator.liu.se/~nisse/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level cryptographic library

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	gmp>=6.0.0:math/gmp
LIB_DEPENDS=	libgmp.so:math/gmp

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		compiler:c11 gmake localbase makeinfo pathfix

CONFIGURE_ARGS=	--enable-shared
CONFIGURE_ENV=	M4="/usr/bin/m4 -g"
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INFO=		nettle
PORTDOCS=	NEWS README nettle.html nettle.pdf
PORTEXAMPLES=	*.c *.h

.include <bsd.mport.options.mk>

.if ${ARCH} == "sparc64"
CONFIGURE_ENV+=	CCPIC=-fPIC
.endif

post-patch:
	@${REINPLACE_CMD} -e '/libdir=/ s|lib32|lib|' ${WRKSRC}/configure
.if ${ARCH} == "mips64"
	@${REINPLACE_CMD} -e 's|__sgi|__unix__|' ${WRKSRC}/configure
.endif

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${INSTALL_DATA} ${PORTEXAMPLES} ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
