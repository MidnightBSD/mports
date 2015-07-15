# $MidnightBSD$
# $FreeBSD: head/security/wolfssl/Makefile 385058 2015-04-30 19:41:38Z johans $

PORTNAME=	wolfssl
PORTVERSION=	3.4.6
CATEGORIES=	security devel
MASTER_SITES=	http://www.yassl.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Embedded SSL C-Library

LICENSE=	gpl2

USES=		zip libtool
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-dependency-tracking \
		--enable-shared --enable-static \
		--enable-dtls --enable-opensslextra --enable-ipv6 \
		--enable-dsa --enable-dh --enable-ecc --enable-sni \
		--enable-ripemd --enable-sha512

USE_LDCONFIG=	yes
PORTDOCS=	*

post-configure:
	@${REINPLACE_CMD} \
		-e 's|$${prefix}/cyassl/include|$${prefix}/include/cyassl|' \
		-e 's|$${prefix}/cyassl/lib|$${prefix}/lib/cyassl|' \
		-e '/^pkgconfigdir/s|(libdir)|&data|' \
		${WRKSRC}/Makefile

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libwolfssl.so

.include <bsd.port.mk>
