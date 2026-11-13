PORTNAME=	pyTooling
DISTVERSIONPREFIX=	v
DISTVERSION=	9.0.0
CATEGORIES=	devel
#MASTER_SITES=	PYPI # requirements.txt is missing
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of arbitrary classes, decorators, meta-classes, exceptions
WWW=		https://pytooling.github.io/pyTooling/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiohttp>=3.12:www/py-aiohttp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}colorama>=0.4.6:devel/py-colorama@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.32:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ruamel.yaml>=0.19.1:devel/py-ruamel.yaml@${PY_FLAVOR}

USES=		python:3.11-3.14 python-setuptools:83
USE_PYTHON=	autoplist pep517
PEP517_WHEEL_DISTNAME=	pytooling
USE_GITHUB=	yes

NO_ARCH=	yes
NO_TEST=	yes

TEST_WRKSRC=	${WRKSRC}

.include <bsd.port.mk>
