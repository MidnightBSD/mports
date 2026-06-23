PORTNAME=	opentelemetry-exporter-otlp-proto-common
PORTVERSION=	1.42.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	opentelemetry_exporter_otlp_proto_common-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	OpenTelemetry Collector Protobuf over HTTP Exporter
WWW=		https://github.com/open-telemetry/opentelemetry-python/tree/main/exporter/opentelemetry-exporter-otlp-proto-common \
		https://github.com/open-telemetry/opentelemetry-python \
		https://opentelemetry.io/

LICENSE=	Apache-2.0

LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}opentelemetry-proto>=${PORTVERSION}:devel/py-opentelemetry-proto@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
