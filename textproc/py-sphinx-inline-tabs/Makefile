PORTNAME=	sphinx-inline-tabs
PORTVERSION=	2023.4.21
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	sphinx_inline_tabs-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add inline tabbed content to your Sphinx documentation
WWW=		https://sphinx-inline-tabs.readthedocs.io/en/latest/ \
		https://github.com/pradyunsg/sphinx-inline-tabs

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=2<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=3,1:textproc/py-sphinx@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
