PORTNAME=	pytest-runner
PORTVERSION=	6.0.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test support for pytest runner in setup.py
WWW=		https://github.com/pytest-dev/pytest-runner

LICENSE=	mit

DEPRECATED=	pytest-runner depends on deprecated features of setuptools
EXPIRATION_DATE=	2024-12-31

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes
# circular
NO_TEST=	yes

.include <bsd.port.mk>
