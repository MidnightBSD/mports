PORTNAME=	distlib
DISTVERSION=	0.3.8
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level components of distutils2 and higher-level APIs
WWW=		https://github.com/pypa/distlib

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes
NO_TEST=	yes

TEST_ENV=	PYTHONHASHSEED=0 # needed for tests to succeed

.include <bsd.port.mk>
