PORTNAME=	nettle
PORTVERSION=	3.7.3
CATEGORIES=	security
MASTER_SITES=	GNU \
		https://www.lysator.liu.se/~nisse/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level cryptographic library

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	gmp>=6.1.0:math/gmp
LIB_DEPENDS=	libgmp.so:math/gmp

OPTIONS_DEFINE=	DOCS EXAMPLES

USES=		compiler:c11 gmake localbase makeinfo pathfix

CONFIGURE_ARGS=	--enable-shared
CONFIGURE_ENV=	M4="/usr/bin/m4 -g"
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INFO=		nettle

EXAMPLES_CFLAGS=	-I${OPENSSLINC}
EXAMPLES_USES=		ssl

.include <bsd.mport.options.mk>

.if ${ARCH} == "sparc64"
CONFIGURE_ENV+=	CCPIC=-fPIC
.endif

post-patch:
	@${REINPLACE_CMD} -e '/libdir=/ s|lib32|lib|' ${WRKSRC}/configure
.if ${ARCH} == "mips64"
	@${REINPLACE_CMD} -e 's|__sgi|__unix__|' ${WRKSRC}/configure
.endif

post-patch-EXAMPLES-off:
	@${REINPLACE_CMD} -e '/SUBDIRS = / s| examples||' ${WRKSRC}/Makefile.in

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/lib*.so

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} NEWS README nettle.html nettle.pdf ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${INSTALL_PROGRAM} base16dec base16enc base64dec base64enc ecc-benchmark hogweed-benchmark nettle-benchmark random-prime rsa-decrypt rsa-encrypt rsa-keygen rsa-sign rsa-verify ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/*.[ch] ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
