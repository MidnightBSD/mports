PORTNAME=	griffe-inherited-docstrings
DISTVERSION=	1.1.4
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	griffe_inherited_docstrings-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Griffe extension for inheriting docstrings
WWW=		https://github.com/mkdocstrings/griffe-inherited-docstrings

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}griffelib>=2.0:textproc/py-griffelib@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}mkdocstrings>=0.29:textproc/py-mkdocstrings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.2:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=5:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=3.15:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.6:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest

TEST_ARGS=	-c config/pytest.ini --cov --cov-config config/coverage.ini
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

.include <bsd.port.mk>
