PORTNAME=	scipy
DISTVERSION=	1.11.1
PORTREVISION=	1
CATEGORIES=	science python
MASTER_SITES=	https://docs.scipy.org/doc/${PORTNAME}-${DISTVERSION}/:doc \
		PYPI:source \
		SF:source
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:source \
		scipy-html-${DISTVERSION}.zip:doc
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

PATCH_SITES=	https://github.com/scipy/scipy/commit/
PATCHFILES=	ab7d08c6148286059f6498ab5c3070268d13cbd9.patch:-p1 # https://github.com/scipy/scipy/pull/21069

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scientific tools for Python
WWW=		https://www.scipy.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYNUMPY} \
		${PYTHON_PKGNAMEPREFIX}pip>0:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pybind11>0:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pythran>=0:devel/py-pythran@${PY_FLAVOR} \
		unzip>0:archivers/unzip
LIB_DEPENDS=	libblas.so:math/blas \
		libopenblas.so:math/openblas
RUN_DEPENDS=	${PYNUMPY}

USES=		compiler:c++14-lang cpe fortran python:3.10-3.11 shebangfix
USE_PYTHON=	autoplist concurrent cython distutils

# circular dependency
NO_TEST=	yes

FFLAGS+=	-std=legacy
LDFLAGS+=	-shared
PYDISTUTILS_BUILDARGS=	--fcompiler=gnu95
PYDISTUTILS_CONFIGUREARGS=	--fcompiler=gnu95

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/scipy/ -name '*.so' | ${XARGS} ${STRIP_CMD}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@${UNZIP_CMD} -d ${FAKE_DESTDIR}${DOCSDIR} ${DISTDIR}/scipy-html-${DISTVERSION}.zip
	@${RM} ${FAKE_DESTDIR}${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}/.buildinfo

.include <bsd.port.mk>
