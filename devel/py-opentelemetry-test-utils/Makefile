PORTNAME=	opentelemetry-test-utils
PORTVERSION=	0.66b1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	opentelemetry_test_utils-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Test utilities for OpenTelemetry Python
WWW=		https://github.com/open-telemetry/opentelemetry-python

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
# Preserve exact equality in package metadata on 4.0 and newer.
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}asgiref>=3.0<4:www/py-asgiref@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.45.1=1.45.1:devel/py-opentelemetry-api@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-sdk>=1.45.1=1.45.1:devel/py-opentelemetry-sdk@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.28<3:www/py-requests@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
