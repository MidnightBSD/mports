PORTNAME=	google-api-core
PORTVERSION=	2.40.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	google_api_core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core Google API Client Library
WWW=		https://googleapis.dev/python/google-api-core/latest/ \
		https://github.com/googleapis/google-cloud-python/tree/main/packages/google-api-core \
		https://github.com/googleapis/google-cloud-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-auth>=2.14.1<3.0.0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}googleapis-common-protos>=1.69.2<2.0.0:devel/py-googleapis-common-protos@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}opentelemetry-api>=1.44.0<2.0.0:devel/py-opentelemetry-api@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}proto-plus>=1.26.1<2.0.0:devel/py-proto-plus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>=6.33.5,1<8.0.0,1:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.33.0<3.0.0:www/py-requests@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	GRPC
OPTIONS_DEFAULT=	GRPC

GRPC_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}grpcio>=${GRPC_MIN}<2.0.0:devel/py-grpcio@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}grpcio-status>=${GRPC_MIN}<2.0.0:devel/py-grpcio-status@${PY_FLAVOR}

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31400
GRPC_MIN=	1.75.1
.else
GRPC_MIN=	1.59.0
.endif

.include <bsd.port.post.mk>
