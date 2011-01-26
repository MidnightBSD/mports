# New ports collection makefile for:	blogbench
# Date created:			Feb 14, 2005
# Whom:				janos.mohacsi@bsd.hu
#
# $MidnightBSD: mports/benchmarks/blogbench/Makefile,v 1.5 2010/02/28 21:30:21 laffer1 Exp $
# $FreeBSD: ports/benchmarks/blogbench/Makefile,v 1.1 2005/02/14 21:04:04 pav Exp $
#

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
