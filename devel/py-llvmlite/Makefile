PORTNAME=	llvmlite
DISTVERSION=	0.50.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight LLVM python binding for writing JIT compilers
WWW=		https://github.com/numba/llvmlite

LICENSE=	bsd2 LLVM2
LICENSE_COMB=	multi
LICENSE_NAME_LLVM2=	Apache License 2.0 with LLVM Exceptions
LICENSE_FILE_bsd2=	${WRKSRC}/LICENSE
LICENSE_FILE_LLVM2=	${WRKSRC}/LICENSE.thirdparty
LICENSE_PERMS_LLVM2=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	gmake:devel/gmake \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

# llvm compatibility table https://github.com/numba/llvmlite#compatibility
USES=		cmake:indirect fortran llvm:22,lib python:3.10+
USE_PYTHON=	autoplist pep517 pytest # many tests fail, see https://github.com/numba/llvmlite/issues/1015

MAKE_ENV=	LLVM_CONFIG=${LLVM_CONFIG} \
		LLVMLITE_SHARED=ON \
		CMAKE_ARGS=-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON

TEST_ENV=	${MAKE_ENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

pre-configure:
# Use required LLVM if multiple variants are present.
	${REINPLACE_CMD} "s,%%LLVM_PREFIX%%,${LLVM_PREFIX}," ${WRKSRC}/ffi/CMakeLists.txt

post-install:
	@${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/llvmlite/binding/libllvmlite*.so

.include <bsd.port.mk>
