PORTNAME=	pylsqpack
PORTVERSION=	0.3.24
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper for the ls-qpack QPACK library
WWW=		https://github.com/aiortc/pylsqpack

LICENSE=	bsd3 mit bsd2
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/vendor/ls-qpack/LICENSE
LICENSE_FILE_bsd2=	${WRKDIR}/xxhash-LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		compiler:c++11-lang python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 unittest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

post-extract:
	${SED} -n '1,/^\*\//p' ${WRKSRC}/vendor/ls-qpack/deps/xxhash/xxhash.c > ${WRKDIR}/xxhash-LICENSE

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
