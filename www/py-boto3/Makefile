PORTNAME=	boto3
PORTVERSION=	1.36.23
CATEGORIES=	www python devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	AWS SDK for Python
WWW=		https://aws.amazon.com/sdk-for-python/ \
		https://github.com/boto/boto3

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}botocore>=${PORTVERSION}<1.37.0:devel/py-botocore@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}jmespath>=0.7.1<2.0.0:devel/py-jmespath@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}s3transfer>=0.11.0<0.12.0:net/py-s3transfer@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

.if defined(MAGUS)
NO_TEST=	yes
.endif

.include <bsd.port.mk>
