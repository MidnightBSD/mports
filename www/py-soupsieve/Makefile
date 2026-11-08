PORTNAME=	soupsieve
PORTVERSION=	2.8.4
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS4 selector implementation for BeautifulSoup
WWW=		https://github.com/facelessuser/soupsieve

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.md

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.26:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}html5lib>0:www/py-html5lib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>4:www/py-beautifulsoup@${PY_FLAVOR}

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517 pytest

NO_ARCH=	yes

.include <bsd.port.mk>
