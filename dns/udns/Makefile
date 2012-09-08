# $MidnightBSD: mports/dns/udns/Makefile,v 1.2 2011/05/15 22:10:34 laffer1 Exp $

PORTNAME=	udns
PORTVERSION=	0.2
CATEGORIES=	dns
MASTER_SITES=	http://www.corpit.ru/mjt/udns/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	DNS resolver library with sync and async queries
LICENSE=	lgpl21

HAS_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

OPTIONS=	IPV6 "Enable IPv6 support" on

ALL_TARGET=	staticlib shared

PORTDOCS=	*

SHLIB_MAJOR=	0

MAN1=		dnsget.1 rblcheck.1
MAN3=		udns.3

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--enable-ipv6
.else
CONFIGURE_ARGS+=	--disable-ipv6
.endif

post-build:
	@cd ${WRKSRC} && ${STRIP_CMD} dnsget_s ex-rdns_s rblcheck_s

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so.${SHLIB_MAJOR}
	${LN} -sf ${PREFIX}/lib/libudns.so.${SHLIB_MAJOR} \
		${PREFIX}/lib/libudns.so
	${INSTALL_DATA} ${WRKSRC}/udns.h ${PREFIX}/include/udns.h
	${INSTALL_DATA} ${WRKSRC}/libudns.a ${PREFIX}/lib/libudns.a
	${INSTALL_PROGRAM} ${WRKSRC}/dnsget_s ${PREFIX}/bin/dnsget
	${INSTALL_PROGRAM} ${WRKSRC}/rblcheck_s ${PREFIX}/bin/rblcheck
.for FILE in ${MAN1}
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man1/${FILE}
.endfor
.for FILE in ${MAN3}
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${MANPREFIX}/man/man3/${FILE}
.endfor

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for FILE in COPYING.LGPL NEWS NOTES TODO
	${INSTALL_DATA} ${WRKSRC}/${FILE} ${DOCSDIR}/${FILE}
.endfor
.endif

.include <bsd.port.post.mk>
