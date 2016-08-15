# $MidnightBSD$

PORTNAME=	pybench
PORTVERSION=	2.0
PORTREVISION=	2
CATEGORIES=	benchmarks python
MASTER_SITES=	http://downloads.egenix.com/python/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensible benchmark suite for Python

LICENSE=	unknown

WRKSRC=		${WRKDIR}/${PORTNAME}

USES=		python zip

PORTDOCS=	README

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
.for docs in ${PORTDOCS}
	@${INSTALL_DATA} ${WRKSRC}/${docs} ${DOCSDIR}
.endfor
.endif
	@${INSTALL_SCRIPT} ${WRKDIR}/pybench.sh ${PREFIX}/bin/pybench

.include <bsd.port.mk>
