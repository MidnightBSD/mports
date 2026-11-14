PORTNAME=	pytkdocs
DISTVERSION=	0.16.5
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Load Python objects documentation
WWW=		https://github.com/mkdocstrings/pytkdocs

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8.2,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=5.0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=3.15:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.6,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django52>0:www/py-django52@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}marshmallow>0:devel/py-marshmallow@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pydantic>0:devel/py-pydantic@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	-c config/pytest.ini

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

OPTIONS_DEFINE=		NUMPYSTYLE
OPTIONS_DEFAULT=	NUMPYSTYLE

NUMPYSTYLE_DESC=	Enable support for Numpy docstrings
NUMPYSTYLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docstring_parser>=0.7:textproc/py-docstring_parser@${PY_FLAVOR}

.include <bsd.port.mk>
