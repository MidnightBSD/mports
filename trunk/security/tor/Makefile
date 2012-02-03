# ports collection makefile for:	tor
# Date created:				9 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/tor/Makefile,v 1.9 2011/06/05 18:18:47 laffer1 Exp $

PORTNAME=	tor
DISTVERSION=	0.2.2.35
CATEGORIES=	security net ipv6
MASTER_SITES=	https://www.torproject.org/dist/ \
		ftp://ftp.bit.nl/mirror/tor/ \
		ftp://ftp.fodt.it/pub/mirror/tor/dist/ \
		ftp://key-server.org/tor/dist/ \
		http://cyberside.net.ee/tor/ \
		http://ftp.bit.nl/mirror/tor/ \
		http://mirror.host4site.co.il/torproject.org/dist/ \
		http://mirror.open-networx.org/torproject.org/dist/ \
		http://mirror.tor.hu/dist/ \
		http://mirrors.chaos-darmstadt.de/tor-mirror/dist/ \
		http://onion.anonymo.us.org/dist/ \
		http://theonionrouter.com/dist/ \
		http://tor.amorphis.eu/dist/ \
		http://tor.askapache.com/dist/ \
		http://tor.beme-it.de/dist/ \
		http://tor.blingblingsquad.net/dist/ \
		http://tor.ccc.de/dist/ \
		http://tor.cyberarmy.at/dist/ \
		http://tor.factor.cc/dist/ \
		http://tor.fodt.it/dist/ \
		http://tor.freie-re.de/dist/ \
		http://tor.homosu.net/dist/ \
		http://tor.idnr.ws/dist/ \
		http://tor.kamagurka.org/dist/ \
		http://tor.key-server.org/dist/ \
		http://tor.searchprivate.com/dist/ \
		http://tor.taiga-san.net/dist/ \
		http://tor.vesta.nu/dist/ \
		http://tordistua.reactor-xg.kiev.ua/ \
		http://torproj.xpdm.us/dist/ \
		https://torproject.antagonism.org/dist/ \
		https://torproject.crypto.is/dist/ \
		http://torproject.is/dist/ \
		http://torproject.nwlinux.us/dist/ \
		http://torua.reactor-xg.kiev.ua/dist/ \
		https://www.coevoet.nl/tor/dist/ \
		http://www.oignon.net/dist/ \
		http://www.torproject.nl/dist/ \
		http://www.torproject.org.in/dist/ \
		http://www.torproject.org.nyud.net/dist/ \
		http://www.torproject.us/dist/ \
		http://www.torservers.net/mirrors/torproject.org/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An anonymizing overlay network for TCP
LICENSE=	bsd3

RUN_DEPENDS=	tsocks:${PORTSDIR}/net/tsocks
LIB_DEPENDS=	event-1.4:${PORTSDIR}/devel/libevent

GNU_CONFIGURE=	yes
USE_OPENSSL=	yes

OPTIONS=	BUFFREELISTS "freelists for buffer RAM" on \
		GEOIP "track country data" off \
		INSTR_DOWNLOADS "instrument downloads for analysis" off \
		TCMALLOC "use the tcmalloc memory allocation library" off \
		THREADS "multi-threading support" on \
		TRANSPARENT "transparent proxy support" on

USE_RC_SUBR=	tor
SUB_FILES=	pkg-message

MANCOMPRESSED=	no
MAN1=		tor.1 tor-resolve.1 torify.1 tor-gencert.1

.include <bsd.port.pre.mk>

.if defined(WITH_BUFFREELISTS)
CONFIGURE_ARGS+=	--enable-buf-freelists
.else
CONFIGURE_ARGS+=	--disable-buf-freelists
.endif

.if defined(WITH_GEOIP)
CONFIGURE_ARGS+=	--enable-geoip-stats
.else
CONFIGURE_ARGS+=	--disable-geoip-stats
.endif

.if defined(WITH_INSTR_DOWNLOADS)
CONFIGURE_ARGS+=	--enable-instrument-downloads
.else
CONFIGURE_ARGS+=	--disable-instrument-downloads
.endif

.if defined(WITH_TCMALLOC)
CONFIGURE_ARGS+=	--with-tcmalloc
LIB_DEPENDS+=		tcmalloc:${PORTSDIR}/devel/google-perftools
.endif

.if defined(WITH_THREADS)
CONFIGURE_ARGS+=	--enable-threads
CFLAGS+=		${PTHREAD_CFLAGS}
.else
CONFIGURE_ARGS+=	--disable-threads
.endif

.if defined(WITH_TRANSPARENT)
CONFIGURE_ARGS+=	--enable-transparent
.else
CONFIGURE_ARGS+=	--disable-transparent
.endif

post-patch:
	@${MV} ${WRKSRC}/contrib/tor-tsocks.conf \
		${WRKSRC}/contrib/tor-tsocks.conf.sample
	@${REINPLACE_CMD} -e "s|tor-tsocks.conf|tor-tsocks.conf.sample|g" \
		${WRKSRC}/contrib/Makefile.in
	@${REINPLACE_CMD} -e '\|CFLAGS=|{s|-g||;s|-O[0-9]\{0,1\}||;}' \
		-e 's|netinet/in6||g' ${WRKSRC}/configure

post-configure:
	@${FIND} -X ${WRKSRC} -type f -name Makefile | ${XARGS} ${REINPLACE_CMD} -e \
		"s|-lpthread|${PTHREAD_LIBS}|g"

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
