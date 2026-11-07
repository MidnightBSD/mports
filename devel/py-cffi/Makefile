PORTNAME=	cffi
PORTVERSION=	2.1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface for Python calling C code
WWW=		https://cffi.readthedocs.io/en/latest/ \
		https://github.com/python-cffi/cffi

LICENSE=	MIT-0 mit
LICENSE_COMB=	multi
LICENSE_NAME_MIT-0=	MIT No Attribution
LICENSE_FILE_MIT-0=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/src/c/libffi_x86_x64/ffi.h
LICENSE_PERMS_MIT-0=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycparser>=0:devel/py-pycparser@${PY_FLAVOR}

USES=		compiler:c11 localbase python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent cython pep517

# magus issues.
NO_TEST=	yes

.include <bsd.port.pre.mk>

# cffi 2.1.0 explicitly refuses the free-threaded build of CPython 3.13; upstream
# supports free-threading from 3.14 on.  A USES=python version range cannot
# express this because python.mk strips the "t" suffix before comparing.  The
# flavor is kept so dependent ports still resolve @py313t.
.if ${FLAVOR:U} == py313t
BROKEN=		cffi does not support the free-threaded build of CPython 3.13
.endif

.if ${CHOSEN_COMPILER_TYPE} == clang
CFLAGS+=	-Wno-shift-negative-value
.endif

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.post.mk>
