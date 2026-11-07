PORTNAME=	pytest-html
PORTVERSION=	4.2.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pytest plugin for generating html reports
WWW=		https://github.com/pytest-dev/pytest-html

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.3:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.13:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=3.0:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-metadata>=2.0:devel/py-pytest-metadata@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=7.0,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
