PORTNAME=	google-resumable-media
PORTVERSION=	2.11.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	google_resumable_media-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for Google Media Downloads and Resumable Uploads
WWW=		https://github.com/googleapis/google-cloud-python/tree/main/packages/google-resumable-media \
		https://github.com/googleapis/google-cloud-python

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-crc32c>=1.0.0<2.0.0:devel/py-google-crc32c@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}brotlicffi>=0:archivers/py-brotlicffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}aiohttp>=3.6.2<4.0.0:www/py-aiohttp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=2.14.1<3.0.0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.18.0<3.0.0:www/py-requests@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	AIOHTTP REQUESTS
OPTIONS_DEFAULT=AIOHTTP REQUESTS
AIOHTTP_DESC=	Use aiohttp
REQUESTS_DESC=	Use requests

AIOHTTP_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiohttp>=3.6.2<4.0.0:www/py-aiohttp@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}google-auth>=2.14.1<3.0.0:security/py-google-auth@${PY_FLAVOR}
REQUESTS_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=2.18.0<3.0.0:www/py-requests@${PY_FLAVOR}

# Upstream system tests require a live cloud account; run the local unit suite.
PYTHON_TEST_ENV?=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
			PYTHONSAFEPATH=1 PYTHONDONTWRITEBYTECODE=1

do-test:
	cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${TEST_ENV} ${PYTHON_TEST_ENV} \
		${PYTHON_CMD} -m pytest --import-mode=importlib tests/unit

.include <bsd.port.mk>
