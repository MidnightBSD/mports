# $MidnightBSD$

PORTNAME=	libsrtp
DISTVERSIONPREFIX=	v
DISTVERSION=	1.5.0
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	GHR

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secure RTP (SRTP) Reference Implementation

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USE_GITHUB=	yes
GH_ACCOUNT=	cisco
WRKSRC=		${WRKDIR}/${GH_PROJECT}-${DISTVERSION}

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-openssl
CFLAGS+=	-fPIC	# Taken from configure script
USES=		gmake pathfix pkgconfig ssl
USE_LDCONFIG=	yes
WITH_OPENSSL_PORT=	yes

.if ! defined(WITH_DEBUG)
CONFIGURE_ARGS+=--disable-debug
.endif

post-patch:
	@${REINPLACE_CMD} \
		-e 's/@LDFLAGS@ -L\./-L. @LDFLAGS@/' \
		-e 's/libsrtp.so/&.0/g' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} '/pkg-config/s/openssl/libcrypto/' \
		${WRKSRC}/configure

post-build:
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${MAKE_ARGS} libsrtp.so.0)

post-install:
	${LN} -s libsrtp.so.0 ${STAGEDIR}${PREFIX}/lib/libsrtp.so

.include <bsd.port.mk>
