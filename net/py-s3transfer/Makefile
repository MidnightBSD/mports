PORTNAME=	s3transfer
PORTVERSION=	0.10.2
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Amazon S3 Transfer Manager for Python
WWW=		https://github.com/boto/s3transfer

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}botocore>=1.33.2<2.0.0:devel/py-botocore@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

# setup.py test runs integration tests which fail
# https://github.com/boto/s3transfer/issues/41
do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m nose -v tests/unit tests/functional

.include <bsd.port.mk>
