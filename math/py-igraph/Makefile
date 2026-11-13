PORTNAME=	igraph
DISTVERSION=	1.0.0
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	python-igraph

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance graph data structures and algorithms
WWW=		https://igraph.org/python/

LICENSE=	gpl2+

BUILD_DEPENDS=	cmake-core>=3.18:devel/cmake-core \
		${LOCALBASE}/bin/flex:textproc/flex
LIB_DEPENDS=	libarpack.so:math/arpack-ng \
		libblas.so:math/blas \
		libglpk.so:math/glpk \
		libgmp.so:math/gmp \
		liblapack.so:math/lapack
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}texttable>=1.6.2:textproc/py-texttable@${PY_FLAVOR}	\
		${PYTHON_PKGNAMEPREFIX}cairocffi>=1.2.0:graphics/py-cairocffi@${PY_FLAVOR}
TEST_DEPENDS=	py.test:devel/py-pytest@${PY_FLAVOR}

USES=		bison gnome pkgconfig python:3.9+ python-setuptools:78
USE_PYTHON=	pep517 concurrent autoplist
USE_GNOME=	libxml2

CFLAGS+=	-ffile-prefix-map=${WRKSRC}=.
CXXFLAGS+=	-ffile-prefix-map=${WRKSRC}=.

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' \
	    ${PATCH_WRKSRC}/setup.py

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/igraph/_igraph*.so

do-test:
	@cd ${WRKDIR} && ${SETENV} PYTHONSAFEPATH=1 \
	    IGRAPH_STAGE=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
	    PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${PYTHONPATH} \
	    ${PYTHON_CMD} ${FILESDIR}/test-stage.py ${WRKSRC}/tests

.include <bsd.port.mk>
