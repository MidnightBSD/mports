PORTNAME=	webtest
PORTVERSION=	3.0.7
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper to test WSGI applications
WWW=		https://docs.pylonsproject.org/projects/webtest/en/latest/ \
		https://github.com/Pylons/webtest

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/license.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}beautifulsoup>=0:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}waitress>=3.0.2:www/py-waitress@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}webob>=1.2:www/py-webob@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
