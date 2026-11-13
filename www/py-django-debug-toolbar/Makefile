PORTNAME=	django-debug-toolbar
PORTVERSION=	8.0.0
CATEGORIES=	www python
MASTER_SITES=	PYPI \
		https://github.com/django-commons/django-debug-toolbar/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	django_debug_toolbar-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Configurable set of panels to display debug information
WWW=		https://django-debug-toolbar.readthedocs.io/en/latest/ \
		https://github.com/django-commons/django-debug-toolbar

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}trove-classifiers>=2026.9.21.13:devel/py-trove-classifiers@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}django52>=5.2:www/py-django52@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sqlparse>=0.2.0:databases/py-sqlparse@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}*django-debug-toolbar

.include <bsd.port.mk>
