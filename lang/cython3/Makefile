PORTNAME=	cython
PORTVERSION=	3.0.12
CATEGORIES=	lang python
MASTER_SITES=	PYPI \
		https://github.com/cython/cython/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	3

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compiler for Writing C Extensions for the Python Language
WWW=		https://cython.org/ \
		https://github.com/cython/cython

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c11 python
USE_PYTHON=	allflavors autoplist concurrent pep517

CONFLICTS_INSTALL=	py*-cython py*-cython-devel # bin/cygdb bin/cython bin/cythonize

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/Cython -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
