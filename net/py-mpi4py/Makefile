PORTNAME=	mpi4py
DISTVERSION=	4.1.2
CATEGORIES=	net parallel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Python bindings for MPI (OpenMPI)
WWW=		https://github.com/mpi4py/mpi4py

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}build>=0:devel/py-build@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	cython autoplist concurrent pep517
LDFLAGS+=	${MPI_LIBS}

NO_TEST=	yes

OPTIONS_DEFINE=		DOCS MANPAGES
MANPAGES_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=5.0.0,1:textproc/py-sphinx@${PY_FLAVOR}

MP?=		OPENMPI

.if ${MP} == "OPENMPI"
USES+=		mpi:openmpi
# Match the separator with ? so mport records the full MPICH package name.
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}mpi4py?mpich-[0-9]*
.elif ${MP} == "MPICH"
USES+=		fortran mpi:mpich
LDFLAGS+=	${LOCALBASE}/lib/gcc${GCC_DEFAULT}/libgcc_s.so
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}mpi4py-[0-9]*
.else
BROKEN=		invalid parameter MP
.endif

PORTDOCS=		*

pre-configure:
	${CP} ${FILESDIR}/mpi.cfg ${WRKSRC}/
	${REINPLACE_CMD} -e 's|%%LOCALBASE%%/mpi/openmpi|${MPI_HOME}|'	\
		${WRKSRC}/mpi.cfg

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.rst ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/docs && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}
	@${RM} ${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}.1

post-build-MANPAGES-on:
	@set -e; set -- ${WRKSRC}/build/lib.*; \
		test "$$#" -eq 1; test -d "$$1"; \
		${SETENV} ${MAKE_ENV} PYTHONPATH="$$1" ${PYTHON_CMD} -m sphinx \
		-b man ${WRKSRC}/docs/source ${WRKDIR}/man

do-install-MANPAGES-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/man3
	${INSTALL_MAN} ${WRKDIR}/man/${PORTNAME}.3 ${FAKE_DESTDIR}${PREFIX}/share/man/man3
	@${ECHO} share/man/man3/mpi4py.3.gz >> ${TMPPLIST}

post-install:
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/mpi4py && ${STRIP_CMD} *.so

.include <bsd.port.mk>
