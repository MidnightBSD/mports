PORTNAME=	babelfont
PORTVERSION=	3.1.3
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstract interface to font source files based on fontParts
WWW=		https://github.com/simoncozens/babelfont

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8.1.0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fontfeatures>=1.8.0:x11-fonts/py-fontfeatures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fonttools>=4.53.1:print/py-fonttools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}openstep-plist>=0.2.2:textproc/py-openstep-plist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}orjson>=3.5.1:devel/py-orjson@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ufolib2>=0.16.0:print/py-ufolib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ufomerge>=1.8.0:print/py-ufomerge@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}defcon>0:x11-fonts/py-defcon@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR}

NO_ARCH=	yes

.include <bsd.port.mk>
