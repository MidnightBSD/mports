PORTNAME=	pytest-rerunfailures
PORTVERSION=	16.3
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:C/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Re-run tests to eliminate flaky failures
WWW=		https://github.com/pytest-dev/pytest-rerunfailures

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

# Upstream excludes pytest 8.2.2; the current mports provider is 9.1.1.
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}packaging>=17.1:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.1,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
