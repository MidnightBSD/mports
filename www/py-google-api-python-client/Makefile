PORTNAME=	google-api-python-client
DISTVERSION=	2.201.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSIONFULL}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google API Client Library for Python
WWW=		https://github.com/googleapis/google-api-python-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=63.1.0_3:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.47.0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=1.31.5<3.0.0:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth-httplib2>=0.2.0<1.0.0:security/py-google-auth-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=1.32.0<3.0.0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httplib2>=0.19.0<1.0.0:www/py-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uritemplate>=3.0.1<5.0.0:net/py-uritemplate@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=1.31.5<3.0.0:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth-httplib2>=0.2.0<1.0.0:security/py-google-auth-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=1.32.0<3.0.0:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httplib2>=0.19.0<1.0.0:www/py-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}oauth2client>=4.1.3:security/py-oauth2client@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parameterized>=0.8.1:devel/py-parameterized@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uritemplate>=3.0.1<5.0.0:net/py-uritemplate@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

# We don't want to use Pytest plugins, for example devel/py-ruff, if available in the system
TEST_ENV=	PYTEST_DISABLE_PLUGIN_AUTOLOAD=1

NO_ARCH=	yes

OPTIONS_DEFINE=		WEBTEST
WEBTEST_DESC=		Use WebTest helper to test WSGI apps
WEBTEST_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyopenssl>0:security/py-pyopenssl@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}webtest>0:www/py-webtest@${PY_FLAVOR}

.include <bsd.port.mk>
