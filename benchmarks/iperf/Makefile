# $MidnightBSD: mports/benchmarks/iperf/Makefile,v 1.2 2008/08/22 14:54:33 laffer1 Exp $

PORTNAME=	iperf
PORTVERSION=	2.0.4
PORTREVISION=	0
CATEGORIES=	benchmarks ipv6
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20source

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A tool to measure maximum TCP and UDP bandwidth
LICENSE=	bsd2

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/iperf
PORTDOCS=	*

OPTIONS=	IPV6	"Enable support to IPv6" 	on \
		THREADS	"Enable threads support"	on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_IPV6)
CONFIGURE_ARGS+=	--disable-ipv6
.endif

.if defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--disable-threads
.else
CONFIGURE_ENV+=		CFLAGS=${PTHREAD_LIBS}
.endif

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.for f in ${WRKSRC}/doc/*.html ${WRKSRC}/doc/*.gif
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.post.mk>
