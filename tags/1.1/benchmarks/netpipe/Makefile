# $MidnightBSD$

PORTNAME=	NetPIPE
PORTVERSION=	3.7.1
CATEGORIES=	benchmarks net
MASTER_SITES=	http://www.scl.ameslab.gov/Projects/Netpipe/code/ \
		http://bitspjoule.org/netpipe/code/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Self-scaling network benchmark
LICENSE=	gpl2

# The default port builds and installs only the TCP version of
# netpipe(1).  The sources support many other variants.

PORTDOCS=	README netpipe_paper.ps
PLIST_FILES=	bin/NPtcp bin/NPtcp6 man/man1/netpipe.1.gz

DOCSDIR=	${PREFIX}/share/doc/${PORTNAME:L}

do-build:
	cd ${WRKSRC} \
		&& ${CC} ${CFLAGS} src/netpipe.c src/tcp.c -DTCP -o NPtcp \
		&& ${CC} ${CFLAGS} src/netpipe.c src/tcp6.c -DTCP6 -o NPtcp6

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/NPtcp ${PREFIX}/bin/NPtcp
	${INSTALL_PROGRAM} ${WRKSRC}/NPtcp6 ${PREFIX}/bin/NPtcp6
	${INSTALL_MAN} ${WRKSRC}/dox/netpipe.1 ${MANPREFIX}/man/man1
.if !defined(NOPORTDOCS)
.for doc in ${PORTDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/dox/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
