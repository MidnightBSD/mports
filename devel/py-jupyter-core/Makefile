PORTNAME=	jupyter-core
PORTVERSION=	5.9.1
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://github.com/jupyter/jupyter_core/releases/download/v${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	jupyter_core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jupyter core package
WWW=		https://jupyter.org/ \
		https://github.com/jupyter/jupyter_core

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.4:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}platformdirs>=2.5:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}traitlets>=5.3:devel/py-traitlets@${PY_FLAVOR}

USES=		python shebangfix
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

SHEBANG_FILES=	jupyter_core/troubleshoot.py

.include <bsd.port.mk>
