PORTNAME=	django-debug-toolbar
DISTVERSION=	4.4.6
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	44
DISTNAME=	django_debug_toolbar-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Private django-debug-toolbar 4.4.6 compatibility provider
WWW=		https://github.com/jazzband/django-debug-toolbar

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}build>=1.0.3:devel/py-build@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}installer>=0.7:devel/py-installer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django42>=4.2.9:www/py-django42@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlparse>=0.2.0:databases/py-sqlparse@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	allflavors flavors
NO_ARCH=	yes

_PRIVATE_DIR=	${PYTHONPREFIX_LIBDIR}/mports-django-debug-toolbar/44

do-build:
	cd ${BUILD_WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} -m build --no-isolation --wheel

do-install:
	${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${PYTHON_CMD} ${FILESDIR}/install-private.py \
		--destdir ${FAKE_DESTDIR:Q} --prefix ${TRUE_PREFIX:Q} \
		--private-dir ${_PRIVATE_DIR:Q} ${BUILD_WRKSRC}/dist/django_debug_toolbar-${DISTVERSION}-*.whl

.include <bsd.port.mk>
