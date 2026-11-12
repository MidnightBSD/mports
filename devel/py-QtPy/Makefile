PORTNAME=	QtPy
DISTVERSION=	2.4.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Abstraction layer on top of the various Qt bindings
WWW=		https://github.com/spyder-ide/qtpy

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>=3:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-qt>0:devel/py-pytest-qt@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}qt5-pyqt>0:devel/py-qt5-pyqt@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist pep517 pytest
NO_ARCH=	yes

DISTNAME=	qtpy-${DISTVERSION}

TEST_ENV=	QT_QPA_PLATFORM=offscreen PYTEST_QT_API=pyqt5 PYTHONDONTWRITEBYTECODE=1 PYTHONSAFEPATH=1
TEST_ARGS=	--import-mode=importlib

.include <bsd.port.mk>
