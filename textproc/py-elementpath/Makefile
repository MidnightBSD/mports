PORTNAME=	elementpath
DISTVERSION=	4.4.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XPath 1.0/2.0/3.0 parsers and selectors for ElementTree and lxml
WWW=		https://github.com/sissaschool/elementpath

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils concurrent autoplist

NO_ARCH=	yes
NO_TEST=	yes

# tests are a circular reference

.include <bsd.port.mk>
