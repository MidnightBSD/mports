PORTNAME=	cffi
PORTVERSION=	2.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface for Python calling C code
WWW=		https://cffi.readthedocs.io/en/latest/ \
		https://github.com/python-cffi/cffi

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycparser>=0:devel/py-pycparser@${PY_FLAVOR}

USES=		compiler:c11 localbase python
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
