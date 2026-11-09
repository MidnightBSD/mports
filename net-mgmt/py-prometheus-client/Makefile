PORTNAME=	prometheus-client
DISTVERSIONPREFIX=	v
DISTVERSION=	0.21.1
CATEGORIES=	net-mgmt python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official Python client for Prometheus
WWW=		https://github.com/prometheus/client_python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}twisted>=17.9.0:devel/py-twisted@${PY_FLAVOR}

USES=		python:3.8+ python-setuptools:78

USE_PYTHON=	autoplist pep517

USE_GITHUB=	yes
GH_ACCOUNT=	prometheus
GH_PROJECT=	client_python

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}coverage>=0:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}attrs>=0:devel/py-attrs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}asgiref>=0:www/py-asgiref@${PY_FLAVOR}

NO_ARCH=	yes

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m coverage run --parallel -m pytest

.include <bsd.port.mk>
