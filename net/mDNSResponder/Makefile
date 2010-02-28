# ex:ts=8
# Ports collection makefile for:  mDNSResponder
# Date created:			  Tues Mar 2, 2004
# Whom:				  Alfred Perlstein <alfred@freebsd.org>
#
# $FreeBSD: ports/net/mDNSResponder/Makefile,v 1.18 2006/09/13 03:21:37 alexbl Exp $
# $MidnightBSD: mports/net/mDNSResponder/Makefile,v 1.3 2008/05/24 06:17:03 laffer1 Exp $
#

PORTNAME=	mDNSResponder
PORTVERSION=	108
CATEGORIES=	net dns
MASTER_SITES=	http://www.opensource.apple.com/darwinsource/tarballs/other/
DISTNAME=	${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apple's mDNSResponder
LICENSE=	agg
#bsd3 and apache 2

USE_LDCONFIG=	YES
USE_GMAKE=	YES
USE_RC_SUBR=	mdnsd.sh
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

post-patch:
	${MV} ${WRKSRC}/mDNSShared/mDNSResponder.8 \
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
