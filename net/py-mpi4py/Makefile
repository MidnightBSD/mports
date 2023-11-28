PORTNAME=	mpi4py
DISTVERSION=	3.1.5
CATEGORIES=	net parallel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Python bindings for MPI (OpenMPI)
WWW=		https://github.com/mpi4py/mpi4py

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

USES=		python
USE_PYTHON=	distutils cython autoplist concurrent
LDFLAGS+=	${MPI_LIBS}

NO_TEST=	yes

SLAVEDIRS=	net/py-mpi4py-mpich

OPTIONS_DEFINE=		DOCS MANPAGES

MP?=		OPENMPI

.if ${MP} == "OPENMPI"
USES+=		mpi:openmpi
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}mpi4py-mpich-3*
.elif ${MP} == "MPICH"
USES+=		fortran mpi:mpich
LDFLAGS+=	${LOCALBASE}/lib/gcc${GCC_DEFAULT}/libgcc_s.so
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}mpi4py-3*
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

do-install-MANPAGES-on:
	${INSTALL_MAN} ${WRKSRC}/docs/${PORTNAME}.1 ${FAKE_DESTDIR}${PREFIX}/man/man1
	@${ECHO} man/man1/mpi4py.1.gz >> ${TMPPLIST}

post-install:
	@cd ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/mpi4py && ${STRIP_CMD} dl*.so MPI*.so lib-pmpi/libvt-hyb*.so lib-pmpi/libvt*.so lib-pmpi/libvt-mpi*.so lib-pmpi/libmpe*.so

.include <bsd.port.mk>
