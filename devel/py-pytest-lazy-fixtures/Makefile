PORTNAME=	pytest-lazy-fixtures
PORTVERSION=	1.4.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_lazy_fixtures-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allow you to use fixtures in @pytest.mark.parametrize
WWW=		https://github.com/dev-petrov/pytest-lazy-fixtures

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-deadfixtures>=4.0.0:devel/py-pytest-deadfixtures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-fixture-classes>=1.0.4:devel/py-pytest-fixture-classes@${PY_FLAVOR}
TEST_ENV=	PYTHONDONTWRITEBYTECODE=1 \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC} \
		PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 \
		PYTEST_PLUGINS=pytest_deadfixtures.plugin

NO_ARCH=	yes

.include <bsd.port.mk>
