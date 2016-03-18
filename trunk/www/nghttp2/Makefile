# Created by: Sunpoet Po-Chuan Hsieh <sunpoet@FreeBSD.org>
# $FreeBSD: head/www/nghttp2/Makefile 394075 2015-08-13 17:31:14Z sunpoet $
# $MidnightBSD$

PORTNAME=	nghttp2
PORTVERSION=	1.8.0
CATEGORIES=	www net
MASTER_SITES=	https://github.com/tatsuhiro-t/${PORTNAME}/releases/download/v${PORTVERSION}/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2.0 C Library

LICENSE=	mit

BUILD_DEPENDS=	libev>=4.15:${PORTSDIR}/devel/libev \
		libevent2>=2.0.8:${PORTSDIR}/devel/libevent2 \
		spdylay>=1.3.0:${PORTSDIR}/www/spdylay
LIB_DEPENDS=	libev.so:${PORTSDIR}/devel/libev \
		libevent_openssl.so:${PORTSDIR}/devel/libevent2 \
		libspdylay.so:${PORTSDIR}/www/spdylay
RUN_DEPENDS:=	${BUILD_DEPENDS}

OPTIONS_DEFINE=	ASIO DOCS HPACK
OPTIONS_DEFAULT=HPACK
OPTIONS_SUB=	yes

CONFIGURE_ARGS=	--disable-python-bindings \
		--enable-app \
		--enable-examples \
		--with-spdylay
CONFIGURE_ENV=	LIBEV_CFLAGS="-I${LOCALBASE}/include" \
		LIBEV_LIBS="-L${LOCALBASE}/lib -lev" \
		OPENSSL_CFLAGS="-I${OPENSSLINC}" \
		OPENSSL_LIBS="-L${OPENSSLLIB} -lcrypto -lssl" \
		ZLIB_CFLAGS="-I${INCLUDEDIR}" \
		ZLIB_LIBS="-L${LIBDIR} -lz"
CPPFLAGS+=	-I${LOCALBASE}/include
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
LIBS+=		-L${LOCALBASE}/lib -lev
USE_CXXSTD=	c++11
USE_GNOME=	libxml2
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
USES=		compiler:c++11-lib gmake libtool pathfix pkgconfig tar:xz

PORTDATA=	fetch-ocsp-response
PORTDOCS=	*

ASIO_BUILD_DEPENDS=	boost-libs>=1.54.0:${PORTSDIR}/devel/boost-libs
ASIO_CONFIGURE_OFF=	--with-boost=no
ASIO_CONFIGURE_ON=	--enable-asio-lib --with-boost=${LOCALBASE} --with-boost-asio --with-boost-system --with-boost-thread
ASIO_LIB_DEPENDS=	libboost_thread.so:${PORTSDIR}/devel/boost-libs
ASIO_RUN_DEPENDS=	boost-libs>=1.54.0:${PORTSDIR}/devel/boost-libs
HPACK_CONFIGURE_ENABLE=	hpack-tools
HPACK_LIB_DEPENDS=	libjansson.so:${PORTSDIR}/devel/jansson
HPACK_BUILD_DEPENDS=	${LOCALBASE}/lib/libjansson.so:${PORTSDIR}/devel/jansson

.include <bsd.port.pre.mk>

CPPFLAGS+=	-D_GLIBCXX_USE_C99

post-patch:
	@${REINPLACE_CMD} -e '/JEMALLOC_LIBS/ s|-ljemalloc||' ${WRKSRC}/configure

.include <bsd.port.post.mk>
