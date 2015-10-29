# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD: head/www/spdylay/Makefile 381872 2015-03-21 22:00:20Z sunpoet $
# $MidnightBSD$

PORTNAME=	spdylay
PORTVERSION=	1.3.2
CATEGORIES=	www net
MASTER_SITES=	https://github.com/tatsuhiro-t/${PORTNAME}/releases/download/v${PORTVERSION}/ \
		LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SPDY protocol version 2, 3 and 3.1 implementation in C

LICENSE=	mit

BUILD_DEPENDS=	libevent2>=2.0.8:${PORTSDIR}/devel/libevent2
LIB_DEPENDS=	libevent_openssl.so:${PORTSDIR}/devel/libevent2
RUN_DEPENDS=	libevent2>=2.0.8:${PORTSDIR}/devel/libevent2

CONFIGURE_ARGS=	--enable-examples \
		--enable-src
CONFIGURE_ENV=	OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lcrypto -lssl" \
		ZLIB_CFLAGS="-I${INCLUDEDIR}" \
		ZLIB_LIBS="-L${LIBDIR} -lz"
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_CXXSTD=	c++11
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
USES=		compiler:c++11-lang libtool pathfix pkgconfig tar:xz

PORTDOCS=	*

.include <bsd.port.pre.mk>

.if ${OSVERSION} < 8000 || !defined(WITH_OPENSSL_PORT)
IGNORE=		spdylay requires OpenSSL 1.0.1+
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^Requires.private: zlib$$|Libs.private: -L${LIBDIR} -lz|' ${WRKSRC}/lib/libspdylay.pc.in

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/examples/spdycli ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKSRC}/shrpx.conf.sample ${PREFIX}/etc/

.include <bsd.port.post.mk>
