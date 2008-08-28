# New ports collection makefile for:    pybench
# Date created:         		29 March 2001
# Whom:                 		Maxim Sobolev <sobomax@FreeBSD.org>
#
# $MidnightBSD: mports/benchmarks/pybench/Makefile,v 1.1 2007/07/15 06:48:02 laffer1 Exp $
# $FreeBSD: ports/benchmarks/pybench/Makefile,v 1.8 2006/08/01 02:52:17 clsung Exp $
#

PORTNAME=	pybench
PORTVERSION=	2.0
PORTREVISION=	1
CATEGORIES=	benchmarks python
MASTER_SITES=	http://downloads.egenix.com/python/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An extensible benchmark suite for Python
LICENSE=	unknown

WRKSRC=		${WRKDIR}/${PORTNAME}

USE_ZIP=	yes
USE_PYTHON=	yes

do-build:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py ${WRKSRC}
	@${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py ${WRKSRC}

pre-fake:
	${PRINTF} '#!/bin/sh\n${PYTHON_CMD} ${DATADIR}/pybench.py "$$@"\n' \
		> ${WRKDIR}/pybench.sh
	
do-install:
	${MKDIR} ${DATADIR}
	@(cd ${WRKSRC} && ${TAR} --exclude README -c -f - .) \
		| (cd ${DATADIR} && ${TAR} --unlink -x -f -)
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}
.endif
	@${INSTALL_SCRIPT} ${WRKDIR}/pybench.sh ${PREFIX}/bin/pybench

.include <bsd.port.mk>
