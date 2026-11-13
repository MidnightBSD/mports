PORTNAME=	pytest-fixture-classes
PORTVERSION=	1.0.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_fixture_classes-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Write pytest fixtures as classes
WWW=		https://github.com/zmievsa/pytest-fixture-classes

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.19.0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}typing-extensions>=4.4.0:devel/py-typing-extensions@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0.21.0:devel/py-pytest-asyncio@${PY_FLAVOR}
TEST_ENV=	PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC}

NO_ARCH=	yes

.include <bsd.port.mk>
