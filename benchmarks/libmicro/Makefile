

PORTNAME=	libmicro
PORTVERSION=	0.4.1
CATEGORIES=	benchmarks
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/ \
		FREEBSD_LOCAL/bdrewery/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of utilities to benchmark productivity of system calls
LICENSE=	cddl

WRKSRC=		${WRKDIR}/libMicro-${PORTVERSION}

USE_GMAKE=	yes
MAKE_ENV=	PTHREAD_LIBS="${PTHREAD_LIBS}"

CFLAGS+=	${PTHREAD_CFLAGS}

STRIP=		 # Do not strip binaries

PLIST_SUB=	ARCH="${ARCH}"

PKGLIBDIR=	${PREFIX}/lib/${PORTNAME}

post-build:
	@${ECHO_CMD} '#!/bin/sh' > ${WRKDIR}/libmicro-bench
	@${ECHO_CMD} '(cd ${PKGLIBDIR} && ./bench $$1)' >> ${WRKDIR}/libmicro-bench.sh

do-install:
	(cd ${WRKDIR} && ${INSTALL_SCRIPT} libmicro-bench.sh \
		${PREFIX}/bin/libmicro-bench)
	(cd ${WRKSRC} && ${INSTALL_SCRIPT} multiview.sh \
		${PREFIX}/bin/multiview)
	@${MKDIR} ${PKGLIBDIR}
	(cd ${WRKSRC} && ${INSTALL_SCRIPT} bench.sh \
		${PKGLIBDIR}/bench)
	@${MKDIR} ${PKGLIBDIR}/bin-${ARCH}
	(cd ${WRKSRC}/bin-${ARCH} \
		&& ${INSTALL_PROGRAM} exec_bin ${PKGLIBDIR}/bin-${ARCH})
	(cd ${WRKSRC}/bin ; for i in * ; do ${INSTALL_PROGRAM} \
		${WRKSRC}/bin-${ARCH}/$$i ${PKGLIBDIR}/bin-${ARCH} ; done)
	@${MKDIR} ${PKGLIBDIR}/bin
	(cd ${PKGLIBDIR}/bin-${ARCH} ; for i in * ; do ${LN} -s \
		../bin-${ARCH}/$$i ../bin ; done)

.include <bsd.port.mk>
