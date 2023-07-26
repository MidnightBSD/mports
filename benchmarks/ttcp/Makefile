PORTNAME=	ttcp
PORTVERSION=	1.12
CATEGORIES=	benchmarks net
MASTER_SITES=	https://BSDforge.com/projects/source/benchmarks/ttcp/
DISTFILES=	ttcp.c ttcp.1 README
DIST_SUBDIR=	${PORTNAME}
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Benchmarking tool for analysing TCP and UDP performance
WWW=		https://ftp.arl.army.mil/~mike/ttcp.html

LICENSE=	publicdom

NO_WRKSUBDIR=	yes

OPTIONS_DEFINE=	DOCS

post-extract:
	${CP} ${DISTDIR}/${DIST_SUBDIR}/ttcp.c ${WRKSRC}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/ttcp.1 ${WRKSRC}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/README ${WRKSRC}

do-build:
	${CC} ${CFLAGS} -o ${WRKSRC}/ttcp ${WRKSRC}/ttcp.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/ttcp ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/ttcp.1 ${MAN1PREFIX}/man/man1

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
