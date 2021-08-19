PORTNAME=	miniupnpc
PORTVERSION=	2.2.0
CATEGORIES?=	net
MASTER_SITES=	http://miniupnp.free.fr/files/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	UPnP IGD client lightweight library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES+=		gmake
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes

CONFIGURE_SCRIPT=	updateminiupnpcstrings.sh
MAKE_ENV+=	INSTALLPREFIX=${PREFIX}

.include <bsd.port.pre.mk>

.if defined(WITH_DEBUG)
CFLAGS+=	-DDEBUG
.endif

.if ${SLAVE_PORT} == no
USE_RC_SUBR=	miniupnpc

post-install:
	${STRIP_CMD} ${PREFIX}/bin/upnpc \
		${PREFIX}/lib/libminiupnpc.so.17
.endif

.include <bsd.port.post.mk>
