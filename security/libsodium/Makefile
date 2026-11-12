PORTNAME=	libsodium
#################################################
# Make sure to bump all consumers when updating #
#################################################
DISTVERSION=	1.0.22
CATEGORIES=	security
MASTER_SITES=	https://github.com/jedisct1/${PORTNAME}/releases/download/${DISTVERSION}-RELEASE/ \
		https://download.libsodium.org/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library to build higher-level cryptographic tools
WWW=		https://github.com/jedisct1/libsodium/

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		libtool pathfix pkgconfig tar:bz2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-blocking-random
INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/AUTHORS ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/README.markdown ${FAKE_DESTDIR}${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/THANKS ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
