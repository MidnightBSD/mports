PORTNAME=	xmltodict
PORTVERSION=	1.0.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/martinblech/xmltodict/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML parser that returns python dictionaries

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
NO_TEST=	yes
USES=		python:3.9+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 pytest

USE_LOCALE=	en_US.UTF-8

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR}

.include <bsd.port.mk>
