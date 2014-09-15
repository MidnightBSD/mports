# $MidnightBSD$

PORTNAME=	blogbench
PORTVERSION=	1.1
CATEGORIES=	benchmarks
MASTER_SITES=	http://download.pureftpd.org/pub/blogbench/ \
		ftp://ftp.pureftpd.org/pub/pure-ftpd/misc/blogbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Filesystem I/O

LICENSE=        bsd4

GNU_CONFIGURE=	yes
USES=		tar:bzip2

PORTDOCS=	README

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
