PORTNAME=	sentry-sdk
DISTVERSION=	2.64.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sentry_sdk-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Client for Sentry
WWW=		https://github.com/getsentry/sentry-python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}certifi>=0:security/py-certifi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}urllib3>=1.26.11,1:net/py-urllib3@${PY_FLAVOR}
# Some dependencies are still missing from the ports collection.
# TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}aiohttp>=0:www/py-aiohttp@${PY_FLAVOR} \
#                 ${PYTHON_PKGNAMEPREFIX}bottle>=0:www/py-bottle@${PY_FLAVOR} \
#                 ${PYTHON_PKGNAMEPREFIX}tornado>=0:www/py-tornado@${PY_FLAVOR}

USES=		cpe python
CPE_VENDOR=	sentry
CPE_PRODUCT=	sentry_software_development_kit
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

# do-test:
#         @(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test)

.include <bsd.port.mk>
