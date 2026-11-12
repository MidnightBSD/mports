PORTNAME=	elementpath
DISTVERSION=	5.1.4
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XPath 1.0/2.0/3.0 parsers and selectors for ElementTree and lxml
WWW=		https://github.com/sissaschool/elementpath

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=0:devel/py-lxml@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	pep517 concurrent autoplist

NO_ARCH=	yes
NO_TEST=	yes

# The test dependency xmlschema depends on elementpath.

.include <bsd.port.mk>
