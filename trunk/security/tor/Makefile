# ports collection makefile for:	tor
# Date created:				9 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/tor/Makefile,v 1.6 2009/06/29 17:25:06 laffer1 Exp $

PORTNAME=	tor
PORTVERSION=	0.2.0.35
PORTREVISION=	1
CATEGORIES=	security net
MASTER_SITES=	http://www.torproject.org/dist/ \
		http://tor.cypherpunks.at/dist/ \
		http://tor.depthstrike.com/dist/ \
		http://tor.boinc.ch/dist/ \
		http://tor.anonymity.cn/dist/

DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An anonymizing overlay network for TCP
LICENSE=	bsd3

RUN_DEPENDS=	tsocks:${PORTSDIR}/net/tsocks
LIB_DEPENDS=	event-1.4:${PORTSDIR}/devel/libevent

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes

OPTIONS=	\
		THREADS "multi-threading support" on \
		TRANSPARENT "transparent proxy support" on \
		VIDALIA "Vidalia graphical Tor controller" off

USE_RC_SUBR=	tor
SUB_FILES=	pkg-message

MANCOMPRESSED=	no
MAN1=		tor.1 tor-resolve.1 torify.1 tor-gencert.1

.include <bsd.port.pre.mk>

CONFIGURE_ENV+=	CPPFLAGS+=-I{LOCALBASE}/include \
		LDFLAGS+=-L{LOCALBASE}/lib

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
CONFIGURE_ENV+=	LDFLAGS+={PTHREAD_LIBS}
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if defined(WITH_TRANSPARENT)
CONFIGURE_ARGS+=	--enable-transparent
.else
CONFIGURE_ARGS+=	--disable-transparent
.endif

.ifdef(WITH_VIDALIA)
RUN_DEPENDS+=	vidalia:${PORTSDIR}/net-mgmt/vidalia
.endif

post-patch:
	@${MV} ${WRKSRC}/contrib/tor-tsocks.conf \
		${WRKSRC}/contrib/tor-tsocks.conf.sample
	@${REINPLACE_CMD} -e "s|tor-tsocks.conf|tor-tsocks.conf.sample|g" \
		${WRKSRC}/contrib/Makefile.in
#fix typos in configure scripts, undesirable compiler flags, wrong location of in6.h
	@${FIND} ${WRKSRC} -type f | ${XARGS} \
		-n 10 ${REINPLACE_CMD} -E \
		-e 's!-g -O2!!' \
		-e 's!-O2!!' \
		-e 's|netintet|netinet|g' \
		-e 's|netinet/in6|netinet6/in6|g'

post-configure:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e \
		's|-lpthread|${PTHREAD_LIBS}|g'

pre-su-install:
	@${SETENV} PKG_PREFIX=${PREFIX} ${SH} \
		${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
	${MKDIR} /var/run/tor
	${CHOWN} _tor:_tor /var/run/tor
	${TOUCH} /var/log/tor
	${CHOWN} _tor:_tor /var/log/tor
	${MKDIR} /var/db/tor/data
	${CHOWN} _tor:_tor /var/db/tor

.include <bsd.port.post.mk>
