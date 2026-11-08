PORTNAME=	python-multipart
PORTVERSION=	0.0.32
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python_multipart-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Streaming multipart parser for Python
WWW=		https://multipart.fastapiexpert.com/ \
		https://github.com/Kludex/python-multipart

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=7.14:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=9.0.3,1:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>=7.1:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-codspeed>=4.1.1:devel/py-pytest-codspeed@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=2.4:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyyaml>=6.0.3:devel/py-pyyaml@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m coverage run -m pytest ${TEST_ARGS:NDESTDIR=*}
	cd ${TEST_WRKSRC} && ${SETENVI} ${WRK_ENV} ${PYTHON_TEST_ENV} ${TEST_ENV} \
		${PYTHON_CMD} -m coverage report

.include <bsd.port.mk>
