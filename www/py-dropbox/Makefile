PORTNAME=	dropbox
PORTVERSION=	12.2.2
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official Dropbox API Client
WWW=		https://dropbox-sdk-python.readthedocs.io/en/latest/ \
		https://github.com/dropbox/dropbox-sdk-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8<11:devel/py-setuptools-scm@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=2.16.2:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}stone>=3.5.3<4:devel/py-stone@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=0:devel/py-pytest-mock@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	test/unit/

NO_ARCH=	yes

.include <bsd.port.mk>
