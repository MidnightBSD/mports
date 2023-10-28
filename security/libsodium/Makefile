PORTNAME=	libsodium
PORTVERSION=	1.0.18
CATEGORIES=	security
MASTER_SITES=	https://download.libsodium.org/libsodium/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to build higher-level cryptographic tools
WWW=		https://github.com/jedisct1/libsodium

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		libtool pathfix pkgconfig
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

CONFIGURE_ARGS+=	--enable-blocking-random
INSTALL_TARGET?=	install-strip
TEST_TARGET=		check

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/AUTHORS ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/README.markdown ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/THANKS ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
