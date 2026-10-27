PORTNAME=	opentelemetry-exporter-http-transport
PORTVERSION=	0.66b1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	opentelemetry_exporter_http_transport-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP transport for OpenTelemetry exporters
WWW=		https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-http-transport

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.15<2:devel/py-opentelemetry-api@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	REQUESTS URLLIB3
OPTIONS_DEFAULT=	REQUESTS
REQUESTS_DESC=	HTTP transport using Requests
URLLIB3_DESC=	HTTP transport using urllib3

REQUESTS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=2.25<3:www/py-requests@${PY_FLAVOR}
URLLIB3_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}urllib3>=1.26:net/py-urllib3@${PY_FLAVOR}

.include <bsd.port.mk>
