PORTNAME=	numpy
DISTVERSION=	2.4.6
PORTEPOCH=	1
CATEGORIES=	math python
MASTER_SITES=	PYPI \
		https://numpy.org/doc/${DISTVERSION:R}/:doc
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${PORTNAME}-html.zip:doc
DIST_SUBDIR=	${PORTNAME}-${DISTVERSION:R}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fundamental package for array computing in Python
WWW=		https://www.numpy.org/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}meson-python>=0.18.0,1:devel/meson-python@${PY_FLAVOR}

USES=		compiler:c++17-lang cpe fortran pkgconfig python:3.11+ shebangfix
USE_PYTHON=	allflavors autoplist concurrent cython pep517

PEP517_BUILD_CONFIG_SETTING=	-Csetup-args=-Dallow-noblas=false \
				-Csetup-args=-Dcpu-baseline-detect=disabled

SHEBANG_GLOB=	*.py
BINARY_ALIAS=	cython=cython-${PYTHON_VER}
PORTDOCS=	*

CONFLICTS_INSTALL=	py*-numpy1

# circular ref
NO_TEST=	yes

OPTIONS_DEFINE=		DOCS
OPTIONS_SINGLE=		BLASLIB SIMD
# mports' blaslapack extension knows atlas, gotoblas, netlib and openblas
# only; there is no flexiblas or blis port to select here.
OPTIONS_SINGLE_BLASLIB=	ATLAS NETLIB OPENBLAS
OPTIONS_SINGLE_SIMD=	MIN NATIVE NONE
OPTIONS_DEFAULT=	MIN OPENBLAS

MIN_DESC=		Minimum recommended CPU features ${MIN_DESC_${ARCH}}
MIN_DESC_amd64=		(x86-64-v2 microarchitecture)
MIN_DESC_i386=		(x86-64-v2 microarchitecture)
NONE_DESC=		Dispatched optimizations only (not recommended except old CPUs)

MIN_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dcpu-baseline=min"
NATIVE_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dcpu-baseline=native"
NONE_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dcpu-baseline=none"

ATLAS_USES=		blaslapack:atlas
ATLAS_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dblas=blas -Csetup-args=-Dlapack=lapack"
NETLIB_LIB_DEPENDS=	libcblas.so:math/cblas
NETLIB_USES=		blaslapack:netlib
NETLIB_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dblas=blas -Csetup-args=-Dlapack=lapack"
OPENBLAS_USES=		blaslapack:openblas
OPENBLAS_VARS=		PEP517_BUILD_CONFIG_SETTING+="-Csetup-args=-Dblas=openblas -Csetup-args=-Dlapack=openblas"

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

# Option helper targets run in the main make, where PREFIX is not
# stage-prefixed and STAGEDIR is empty, so FAKE_DESTDIR has to be explicit.
post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${UNZIP_NATIVE_CMD} -qo ${DISTDIR}/${DIST_SUBDIR}/${PORTNAME}-html.zip \
		-d ${FAKE_DESTDIR}${DOCSDIR}
	@${RM} ${FAKE_DESTDIR}${DOCSDIR}/.buildinfo

.include <bsd.port.mk>
