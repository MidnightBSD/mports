PORTNAME=	pytest-django
PORTVERSION=	4.11.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_django-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Django plugin for py.test
WWW=		https://pytest-django.readthedocs.io/en/latest/ \
		https://github.com/pytest-dev/pytest-django

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=61.0.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=5.0.0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7.0.0,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
