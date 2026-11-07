PORTNAME=	pyproject_api
DISTVERSION=	1.11.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	API to interact with the python pyproject.toml based projects
WWW=		https://pyproject-api.readthedocs.io/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.5:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.28:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PY_TOMLI} \
		${PYTHON_PKGNAMEPREFIX}packaging>=25:devel/py-packaging@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
