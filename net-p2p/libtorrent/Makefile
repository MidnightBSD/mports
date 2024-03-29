PORTNAME=	libtorrent
PORTVERSION=	0.13.8
CATEGORIES=	net-p2p
MASTER_SITES=	https://rtorrent.net/downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Library

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf compiler:c++11-lang libtool localbase:ldflags pathfix pkgconfig ssl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-debug
CONFIGURE_ENV=	OPENSSL_LIBS="-L${OPENSSLLIB} -lcrypto" OPENSSL_CFLAGS="-I\
								${OPENSSLINC}"
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	KQUEUE
OPTIONS_DEFAULT=KQUEUE
KQUEUE_DESC=	Use kqueue(2) support

# This makes sure that /usr/local/lib appears before /usr/lib when
# linking libtorrent to avoid linking with base's libcrypto.
MAKE_ARGS=	LDFLAGS="${LDFLAGS}"

KQUEUE_CONFIGURE_WITH=	kqueue

.include <bsd.port.pre.mk>

# Disable instrumentation, which requires 64-bit atomic ops, on i386 (when
# using gcc) and powerpc to avoid linking errors:
# /usr/local/lib/libtorrent.so: undefined reference to `__sync_add_and_fetch_8'
# /usr/local/lib/libtorrent.so: undefined reference to `__sync_fetch_and_and_8'
.if ${ARCH} == i386 && ${CHOSEN_COMPILER_TYPE} == gcc || ${ARCH} == powerpc
CONFIGURE_ARGS+=--disable-instrumentation
.endif

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libtorrent.so.21.0.0

.include <bsd.port.post.mk>
