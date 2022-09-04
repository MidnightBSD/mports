PORTNAME=	wolfssl
PORTVERSION=	5.4.0
CATEGORIES=	security devel
MASTER_SITES=	https://www.wolfssl.com/ \
		FREEBSD_LOCAL/fox

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embedded SSL C-Library

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe libtool zip
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-certgen \
		--enable-des3 \
		--enable-dh \
		--enable-dsa \
		--enable-dtls \
		--enable-ecc \
		--enable-ipv6 \
		--enable-keygen \
		--enable-opensslall \
		--enable-opensslextra \
		--enable-ripemd \
		--enable-sessioncerts \
		--enable-sha512 \
		--enable-shared \
		--enable-sni \
		--enable-ssh \
		--enable-static \
		--enable-tls13 \
		--enable-tls13-draft18
CFLAGS+=	-DWOLFSSL_ALT_NAMES
PORTDOCS=	*
OPTIONS_DEFINE=	DEBUG DOCS

DEBUG_CONFIGURE_ON=	--enable-debug

# magus
NO_TEST=	yes

post-configure:
	@${REINPLACE_CMD} \
		-e 's|$${prefix}/cyassl/include|$${prefix}/include/cyassl|' \
		-e 's|$${prefix}/cyassl/lib|$${prefix}/lib/cyassl|' \
		-e '/^pkgconfigdir/s|(libdir)|&data|' \
		${WRKSRC}/Makefile

post-install-DEBUG-off:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/lib/libwolfssl.so

.include <bsd.port.mk>
