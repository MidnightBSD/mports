PORTNAME=	pytest-gitconfig
DISTVERSION=	0.9.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	pytest_gitconfig-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Git configuration sandbox for pytest
WWW=		https://github.com/noirbizarre/pytest-gitconfig

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pdm-backend>0:devel/py-pdm-backend@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=7.1.2:devel/py-pytest@${PY_FLAVOR} \
		git:devel/git
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9.0:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-sugar>=0.9.5:devel/py-pytest-sugar@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist pep517 pytest

NO_ARCH=	yes

.include <bsd.port.mk>
