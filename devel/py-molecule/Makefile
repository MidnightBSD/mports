PORTNAME=	molecule
PORTVERSION=	26.6.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Aid for the development and testing of Ansible roles
WWW=		https://molecule.readthedocs.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=7.0.5:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ansible-compat>=25.1.4:sysutils/py-ansible-compat@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}ansible-core>=2.15.0:sysutils/py-ansible-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}click>=8.0<9:devel/py-click@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}enrich>=1.2.7:textproc/py-enrich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jsonschema>=4.9.1:devel/py-jsonschema@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=2.11.3:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=23.2:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pluggy>=0.7.1<2.0:devel/py-pluggy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}rich>=9.5.1:textproc/py-rich@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=5.1:devel/py-pyyaml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wcmatch>=8.1.2:textproc/py-wcmatch@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage>=7.10.6:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock>=3.9.0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pexpect>=4.9.0<5:misc/py-pexpect@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=2.9.0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-html>=3.0.0:devel/py-pytest-html@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.10.0:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-plus>=0.7.0:devel/py-pytest-plus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.8.0,1:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python:3.11+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

NO_ARCH=	yes

OPTIONS_DEFINE=		DOCKER DOCS LINT
OPTIONS_DEFAULT=	LINT
DOCKER_DESC=		For testing on Docker Platform(Remote)
LINT_DESC=		For linting molecule itself
DOCKER_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}docker>=2.0.0:sysutils/py-docker@${PY_FLAVOR}
LINT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flake8>=3.8.4:devel/py-flake8@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pre-commit>=2.10.1:devel/py-pre-commit@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}yamllint>0:devel/py-yamllint@${PY_FLAVOR}

.include <bsd.port.mk>
