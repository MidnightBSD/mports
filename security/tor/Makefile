# ports collection makefile for:	tor
# Date created:				9 Nov 2007
# Whom:					Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/security/tor/Makefile,v 1.8 2011/02/02 16:14:56 laffer1 Exp $

PORTNAME=	tor
DISTVERSION=	0.2.1.30
CATEGORIES=	security net ipv6
MASTER_SITES=	http://www.torproject.org/dist/ \
		ftp://ftp.bit.nl/mirror/tor/ \
		http://cyberside.net.ee/tor/ \
		http://mirrors.chaos-darmstadt.de/tor-mirror/dist/ \
		http://tor-www.5coluna.com/dist/ \
		http://tor.amorphis.eu/dist/ \
		http://tor.askapache.com/dist/ \
		http://tor.beme-it.de/dist/ \
		http://tor.boinc.ch/dist/ \
		http://tor.ccc.de/dist/ \
		http://tor.homosu.net/dist/ \
		http://tor.idnr.ws/dist/ \
		http://tor.searchprivate.com/dist/ \
		http://tor.taiga-san.net/dist/ \
		http://torproj.xpdm.us/dist/ \
		http://torproject.nwlinux.us/dist/ \
		http://www.oignon.net/dist/ \
		http://www.torproject.org.nyud.net/dist/ \
		http://www.torproject.us/dist/

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
