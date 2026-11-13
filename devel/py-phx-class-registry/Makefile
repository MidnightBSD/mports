PORTNAME=	phx-class-registry
DISTVERSION=	5.1.1
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Factory+Registry pattern for Python classes
WWW=		https://github.com/todofixthis/class-registry/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENCE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=1.8.0:devel/py-poetry-core@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8.1,1<9,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517 pytest

USE_GITHUB=	yes
GH_ACCOUNT=	todofixthis
GH_PROJECT=	class-registry

NO_ARCH=	yes

PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} PYTHONSAFEPATH=1
TEST_ENV+=	PYTHONDONTWRITEBYTECODE=1
TEST_ARGS=	--import-mode=importlib

.include <bsd.port.mk>
