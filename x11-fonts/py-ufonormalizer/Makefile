PORTNAME=	ufonormalizer
PORTVERSION=	0.6.3
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Script to normalize the XML and other data inside of a UFO
WWW=		https://github.com/unified-font-object/ufoNormalizer

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 unittest

TEST_WRKSRC=	${WRKSRC}/tests
TEST_ENV=	PYTHONSAFEPATH=1 PYTHONDONTWRITEBYTECODE=1

NO_ARCH=	yes

.include <bsd.port.mk>
