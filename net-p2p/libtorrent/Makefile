# $MidnightBSD$

PORTNAME=	libtorrent
PORTVERSION=	0.13.4
PORTREVISION=	3
CATEGORIES=	net-p2p
MASTER_SITES=	http://libtorrent.rakshasa.no/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Library written in C++

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool pathfix pkgconfig
USE_OPENSSL=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_ENV=	OPENSSL_LIBS="-L${OPENSSLBASE}/lib -ssl -crypto" OPENSSL_CFLAGS="-I${OPENSSLBASE}/include"
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	KQUEUE IPV6
OPTIONS_DEFAULT=	KQUEUE
KQUEUE_DESC=	Use kqueue(2) support
KQUEUE_CONFIGURE_ON=	--with-kqueue
IPV6_CONFIGURE_ON=	--enable-ipv6

.include <bsd.port.pre.mk>

USES+=	compiler:c++11-lang

# Disable amd64 atomic ops on i386 when using gcc
# undefined reference to __sync_add_and_fetch_8
# undefined reference to __sync_fetch_and_and_8
.if ${ARCH} == "i386" && ${COMPILER_TYPE} == "gcc"
CONFIGURE_ARGS+=	--disable-instrumentation
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-O3|${CFLAGS}|' ${WRKSRC}/configure

.include <bsd.port.post.mk>
