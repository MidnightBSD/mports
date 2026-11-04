PORTNAME=	opentelemetry-exporter-otlp-common
PORTVERSION=	0.66b1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	opentelemetry_exporter_otlp_common-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Common utilities for OpenTelemetry OTLP HTTP exporters
WWW=		https://github.com/open-telemetry/opentelemetry-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}opentelemetry-sdk>=1.45.1:devel/py-opentelemetry-sdk@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
