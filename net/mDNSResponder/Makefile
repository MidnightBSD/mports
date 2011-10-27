# $FreeBSD: ports/net/mDNSResponder/Makefile,v 1.18 2006/09/13 03:21:37 alexbl Exp $
# $MidnightBSD: mports/net/mDNSResponder/Makefile,v 1.6 2010/08/25 22:18:27 laffer1 Exp $

PORTNAME=	mDNSResponder
PORTVERSION=	320.10
CATEGORIES=	net dns
MASTER_SITES=	http://opensource.apple.com/tarballs/mDNSResponder/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apple's mDNSResponder
LICENSE=	agg
#bsd3 and apache 2

MAKE_JOBS_UNSAFE=	yes

USE_BISON=	build
USE_LDCONFIG=	YES

USE_GMAKE=	YES
USE_RC_SUBR=	mdnsd
MAKE_ARGS+=	os=freebsd LOCALBASE=${FAKE_DESTDIR}${PREFIX} MANPATH=${FAKE_DESTDIR}${MANPREFIX}/man
BUILD_WRKSRC=	${WRKSRC}/mDNSPosix
INSTALL_WRKSRC=	${WRKSRC}/mDNSPosix
EXTRA_PROGS_BIN=mDNSClientPosix \
		mDNSIdentify \
		mDNSNetMonitor \
		mDNSProxyResponderPosix \
		mDNSResponderPosix
EXTRA_PROGS_SBIN=dnsextd

EXTRAMAN8=	dnsextd.8 mDNSResponderPosix.8

MAN8=		mdnsd.8 ${EXTRAMAN8}

CONFLICTS=	avahi-libdns-[0-9]*

.include <bsd.port.pre.mk>

.if ${OSVERSION} >= 3011
IGNORE=	Included in MidnightBSD 0.3+
.endif

post-patch:
	@${REINPLACE_CMD} -e '/	cc / s|cc|$${CC}|' ${WRKSRC}/Clients/Makefile
	@${MV} ${WRKSRC}/mDNSShared/mDNSResponder.8 \
		${WRKSRC}/mDNSShared/mDNSResponderPosix.8

pre-build:
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' \
		-e 's|mDNSResponder.8|mDNSResponderPosix.8|g' \
		${WRKSRC}/mDNSPosix/Makefile

post-install:
	cd ${INSTALL_WRKSRC}/build/prod && \
		${INSTALL_PROGRAM} ${EXTRA_PROGS_BIN} ${PREFIX}/bin && \
		${INSTALL_PROGRAM} ${EXTRA_PROGS_SBIN} ${PREFIX}/sbin
.	for section in 1 2 3 4 5 6 7 8
.		for page in ${EXTRAMAN${section}}
			${INSTALL_MAN} ${WRKSRC}/mDNSShared/${page} ${MAN${section}PREFIX}/man/man${page:E}/
.		endfor
.	endfor

.include <bsd.port.post.mk>
