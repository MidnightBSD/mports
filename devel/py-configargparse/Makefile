PORTNAME=	configargparse
PORTVERSION=	1.8.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Drop-in replacement for argparse
WWW=		https://github.com/bw2/ConfigArgParse

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}toml>=0:devel/py-toml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mock>=0:devel/py-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent pep517 unittest

TEST_ENV=	HOME=${WRKDIR}/test-home PYTHONDONTWRITEBYTECODE=1

pre-test:
	${MKDIR} ${WRKDIR}/test-home

NO_ARCH=	yes

.include <bsd.port.mk>
