PORTNAME=	google-cloud-documentai
DISTVERSION=	3.17.0
CATEGORIES=	www python # machine-learning
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google Cloud Document AI API client library
WWW=		https://docs.cloud.google.com/python/docs/reference/documentai/latest \
		https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-documentai \
		https://github.com/googleapis/google-cloud-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-asyncio>=0:devel/py-pytest-asyncio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=0:devel/py-pytest-mock@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=2.28.0<3.0.0:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=2.14.1<3.0.0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}grpcio>=${_DOCUMENTAI_GRPC_MIN}<2.0.0:devel/py-grpcio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}grpcio-status>=${_DOCUMENTAI_GRPC_MIN}<2.0.0:devel/py-grpcio-status@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}proto-plus>=1.26.1<2.0.0:devel/py-proto-plus@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>=6.33.5,1<8.0.0,1:devel/py-protobuf@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	pep517 autoplist pytest

# Keep the package-name separator inside a glob for mport's conflict parser.
CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}google?auth-2.24.0 \
			${PYTHON_PKGNAMEPREFIX}google?auth-2.24.0_* \
			${PYTHON_PKGNAMEPREFIX}google?auth-2.25.0 \
			${PYTHON_PKGNAMEPREFIX}google?auth-2.25.0_*

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31400
_DOCUMENTAI_GRPC_MIN=	1.75.1
.else
_DOCUMENTAI_GRPC_MIN=	1.59.0
.endif

.include <bsd.port.post.mk>
