PORTNAME=	s3fs
PORTVERSION=	2026.9.0
CATEGORIES=	filesystems devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convenient Filesystem interface over S3
WWW=		https://s3fs.readthedocs.io/en/latest/ \
		https://github.com/fsspec/s3fs

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiobotocore>=2.19.0<4.0.0:devel/py-aiobotocore@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}aiohttp>=3.9.0:www/py-aiohttp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}fsspec>=${PORTVERSION}<2026.9.1:filesystems/py-fsspec@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
