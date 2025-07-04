PORTNAME=	google-api-python-client
DISTVERSION=	2.123.0
PORTREVISION=	0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google API Client Library for Python
WWW=		https://github.com/googleapis/google-api-python-client

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=1.31.5:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth-httplib2>=0.1.0:security/py-google-auth-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=1.19:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httplib2>=0.15.0:www/py-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}oauth2client>=4.1.3:security/py-oauth2client@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uritemplate>=3.0.1:net/py-uritemplate@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}google-api-core>=1.31.5:www/py-google-api-core@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth-httplib2>=0.1.0:security/py-google-auth-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}google-auth>=1.19:security/py-google-auth@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}httplib2>=0.15.0:www/py-httplib2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}oauth2client>=4.1.3:security/py-oauth2client@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}parameterized>=0.8.1:devel/py-parameterized@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}uritemplate>=3.0.1:net/py-uritemplate@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils unittest

NO_ARCH=	yes

OPTIONS_DEFINE=		WEBTEST
WEBTEST_DESC=		Use WebTest helper to test WSGI apps
WEBTEST_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}openssl>0:security/py-openssl@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}webtest>0:www/py-webtest@${PY_FLAVOR}

.include <bsd.port.mk>
