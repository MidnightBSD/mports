PORTNAME=	py-cpuinfo2
PORTVERSION=	10.1.1
CATEGORIES=	sysutils python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	py_cpuinfo2-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get CPU info with pure Python
WWW=		https://github.com/akx/py-cpuinfo2

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}py-cpuinfo

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8.4.2,1:devel/py-pytest@${PY_FLAVOR}

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest

.include <bsd.port.mk>
