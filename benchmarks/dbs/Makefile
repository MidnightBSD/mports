# New ports collection makefile for: dbs
# Date created: 	1 August 1998
# Whom:			jkoshy
#
# $MidnightBSD: mports/benchmarks/dbs/Makefile,v 1.2 2008/05/23 14:47:41 crash Exp $
# $FreeBSD: ports/benchmarks/dbs/Makefile,v 1.12 2007/05/19 20:00:19 flz Exp $
#

PORTNAME=	dbs
PORTVERSION=	1.1.5
PORTREVISION=	1
CATEGORIES=	benchmarks
MASTER_SITES=	http://www.kusa.ac.jp/~yukio-m/dbs/software1.1.5/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	jkoshy

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A distributed network benchmarking system
LICENSE=        other
RUN_DEPENDS=	gnuplot:${PORTSDIR}/math/gnuplot

DOCDIR=		${PREFIX}/share/doc/dbs/
DOCS=		dbs.man dbs.man.jis dbs_paper.ps Copyright
EXDIR=		${PREFIX}/share/examples/dbs/
EXS=		TCP2.cmd TCPvsMPEG.cmd

do-build:
	cd ${WRKSRC}/src; ${MAKE} dir
	cd ${WRKSRC}/obj/${OPSYS}; ${MAKE} ${ALL_TARGET} PREFIX=${PREFIX}

do-install:
	cd ${WRKSRC}/obj/${OPSYS}; ${MAKE} ${INSTALL_TARGET} PREFIX=${PREFIX}
	${STRIP_CMD} ${PREFIX}/bin/dbsc ${PREFIX}/bin/dbsd
	${MKDIR} ${EXDIR}
	cd ${WRKSRC}/sample; ${CP} -p ${EXS} ${EXDIR}
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCDIR}
	cd ${WRKSRC}/doc; ${CP} -p ${DOCS} ${DOCDIR}
.endif

.include <bsd.port.mk>
