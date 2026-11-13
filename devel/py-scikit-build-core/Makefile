PORTNAME=	scikit-build-core
DISTVERSION=	1.1.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Build backend for CMake based projects
WWW=		https://scikit-build-core.readthedocs.io/en/latest/ \
		https://github.com/scikit-build/scikit-build-core

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	multi
LICENSE_FILE_Apache-2.0=	${WRKSRC}/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/src/scikit_build_core/_vendor/pyproject_metadata/LICENSE

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}hatch-fancy-pypi-readme>0:devel/py-hatch-fancy-pypi-readme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.4:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.24:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PY_EXCEPTIONGROUP} \
		${PYTHON_PKGNAMEPREFIX}packaging>=23.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pathspec>=0.12.0:devel/py-pathspec@${PY_FLAVOR} \
		${PY_TOMLI}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=0.8:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cattrs>=22.2.0:devel/py-cattrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock>=3.8:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fastjsonschema>0:devel/py-fastjsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}numpy>=0:math/py-numpy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pip>=23:devel/py-pip@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pybind11>=2.11:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-subprocess>=1.5:devel/py-pytest-subprocess@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.1,1:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}validate-pyproject>0:devel/py-validate-pyproject@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}virtualenv>=20.20:devel/py-virtualenv@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.40:devel/py-wheel@${PY_FLAVOR} \
		cmake:devel/cmake-core \
		git:devel/git \
		ninja>0:devel/ninja

USES=		python:3.9+
USE_PYTHON=	pep517 autoplist pytest

TEST_ENV=	${MAKE_ENV} \
		PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}
TEST_ARGS=	-ra --strict-markers --strict-config

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31100
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}typing-extensions>=4:devel/py-typing-extensions@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
