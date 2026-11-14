PORTNAME=	sphinx-llm
DISTVERSION=	1.0.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/g}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of Sphinx extensions for working with LLMs
WWW=		https://github.com/NVIDIA/sphinx-llm

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.5.0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.31.0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx-markdown-builder>=0.6.8:textproc/py-sphinx-markdown-builder@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=9.0.4,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

.include <bsd.port.mk>
