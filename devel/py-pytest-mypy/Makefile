PORTNAME=	pytest-mypy
PORTVERSION=	0.10.3
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mypy static type checker plugin for pytest
WWW=		https://github.com/realpython/pytest-mypy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=59.6:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.4:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.37.1:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}attrs>=19.0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock>=3.0:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mypy>=0.900:devel/py-mypy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=4.6,1:devel/py-pytest@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pexpect>=0:misc/py-pexpect@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=0:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=0,1:devel/py-pytest-xdist@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517
# pytest

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
