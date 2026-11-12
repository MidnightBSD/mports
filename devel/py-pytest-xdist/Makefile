PORTNAME=	pytest-xdist
DISTVERSION=	3.8.0
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest xdist plugin for distributed testing and loop-on-failing modes
WWW=		https://github.com/pytest-dev/pytest-xdist

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.2.3:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}execnet>=2.1:sysutils/py-execnet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7.0.0,1:devel/py-pytest@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}filelock>=0:sysutils/py-filelock@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

NO_ARCH=	yes

OPTIONS_DEFINE=		PSUTIL SETPROCTITLE
OPTIONS_DEFAULT=	PSUTIL SETPROCTITLE

PSUTIL_DESC=		Detect number of available CPUs
SETPROCTITLE_DESC=	Indicate state of current running workers

PSUTIL_RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}psutil>=3.0:sysutils/py-psutil@${PY_FLAVOR}
SETPROCTITLE_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR}

DISTNAME=	pytest_xdist-${DISTVERSION}

.include <bsd.port.mk>
