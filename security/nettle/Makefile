PORTNAME=	nettle
PORTVERSION=	3.9.1
CATEGORIES=	security
MASTER_SITES=	GNU \
		https://www.lysator.liu.se/~nisse/archive/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level cryptographic library
WWW=		https://www.lysator.liu.se/~nisse/nettle/

LICENSE=	gpl2 gpl3 lgpl3
LICENSE_COMB=	multi

BUILD_DEPENDS=	gmp>=6.1.0:math/gmp
LIB_DEPENDS=	libgmp.so:math/gmp

USES=		compiler:c11 cpe gmake localbase makeinfo pathfix

CONFIGURE_ARGS=	--enable-shared
CONFIGURE_ENV=	M4="/usr/bin/m4 -g"
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

INFO=		nettle

CPE_VENDOR=	nettle_project

OPTIONS_DEFINE=	DOCS EXAMPLES

EXAMPLES_CFLAGS=	-I${OPENSSLINC}
EXAMPLES_USES=		ssl
EXAMPLES_EXTRA_PATCHES_OFF=	${PATCHDIR}/extra-patch-Makefile.in

.include <bsd.mport.options.mk>

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
