# $MidnightBSD$

PORTNAME=	iperf
PORTVERSION=	2.0.12
CATEGORIES=	benchmarks
MASTER_SITES=	SF/${PORTNAME}2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to measure maximum TCP and UDP bandwidth

LICENSE=	bsd2

OPTIONS_DEFINE=	DOCS IPV6 THREADS
OPTIONS_DEFAULT=THREADS

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/iperf man/man1/iperf.1.gz
PORTDOCS=	*

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MIPV6}
CATEGORIES+=	ipv6
CONFIGURE_ARGS+=--enable-ipv6
.else
CONFIGURE_ARGS+=--disable-ipv6
.endif

.if ${PORT_OPTIONS:MTHREADS}
CONFIGURE_ARGS+=--enable-threads
LDFLAGS+=	${PTHREAD_LIBS}
.else
CONFIGURE_ARGS+=--disable-threads
.endif

post-install:
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} README doc/*.gif doc/*.html ${DOCSDIR}/
.endif

.include <bsd.port.mk>
