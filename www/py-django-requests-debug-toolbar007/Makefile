PORTNAME=	django-requests-debug-toolbar
DISTVERSION=	0.0.7
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	007

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private django-requests-debug-toolbar 0.0.7 compatibility provider
WWW=		https://github.com/marceltschoppch/django-requests-debug-toolbar

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django-debug-toolbar44>=4.4.6:www/py-django-debug-toolbar44@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}django42>=4.2:www/py-django42@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR}

# Django 4.2 requires Python 3.8+; requests_panel needs cgi through Python 3.12.
USES=		python:3.8-3.12
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-django-requests-debug-toolbar/007

do-build:
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} ${BUILD_WRKSRC}/dist/django_requests_debug_toolbar-${DISTVERSION}-*.whl

.include <bsd.port.mk>
