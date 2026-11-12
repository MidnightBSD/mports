PORTNAME=	griffelib
DISTVERSION=	2.4.1
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Signatures for entire Python programs / library components
WWW=		https://github.com/mkdocstrings/griffe

LICENSE=	iscl
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uv-dynamic-versioning>=0.7:devel/py-uv-dynamic-versioning@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}colorama>=0.4:devel/py-colorama@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}griffe-inherited-docstrings>=1.1.2:textproc/py-griffe-inherited-docstrings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.2:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-gitconfig>=0.8.0:devel/py-pytest-gitconfig@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}griffecli>=${DISTVERSION}:textproc/py-griffecli@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=4.18.0:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mkdocstrings>=0.29:textproc/py-mkdocstrings@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.6,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		git:devel/git

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest
TEST_ARGS=	-n ${MAKE_JOBS_NUMBER}
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

OPTIONS_DEFINE=	PYPI

PYPI_DESC=	Support for download/inspect packages from PyPI

PYPI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pip>=24.0:devel/py-pip@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}platformdirs>=4.2:devel/py-platformdirs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}wheel>=0.42:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
