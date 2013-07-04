# $MidnightBSD: mports/benchmarks/blogbench/Makefile,v 1.6 2010/11/14 18:44:39 laffer1 Exp $

PORTNAME=	blogbench
PORTVERSION=	1.1
CATEGORIES=	benchmarks
MASTER_SITES=	http://download.pureftpd.org/pub/blogbench/ \
		ftp://ftp.pureftpd.org/pub/pure-ftpd/misc/blogbench/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Performance Test of Filesystem I/O
LICENSE=        bsd4

GNU_CONFIGURE=	yes
USE_BZIP2=	yes

MAN8=		blogbench.8
PORTDOCS=	README

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
