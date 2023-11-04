PORTNAME=	miniupnpc
PORTVERSION=	2.2.5
CATEGORIES?=	net
MASTER_SITES=	http://miniupnp.free.fr/files/

MAINTAINER?=	ports@MidnightBSD.org
COMMENT?=	UPnP IGD client lightweight library
WWW=		http://miniupnp.free.fr/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES+=		cpe gmake
HAS_CONFIGURE=	yes
USE_LDCONFIG=	yes
CPE_VENDOR=	miniupnp_project
CONFIGURE_SCRIPT=	updateminiupnpcstrings.sh
MAKE_ENV+=	INSTALLPREFIX=${PREFIX} LIBDIR=lib

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
