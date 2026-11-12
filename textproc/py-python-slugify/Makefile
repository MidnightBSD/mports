PORTNAME=	python-slugify
PORTVERSION=	9.1.3
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Slugify application that handles unicode
WWW=		https://github.com/un33k/python-slugify

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}text-unidecode>=1.3:converters/py-text-unidecode@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR}

### Can optionally require:
### 	${PYTHON_PKGNAMEPREFIX}unidecode>=1.1.1:converters/py-unidecode@${PY_FLAVOR}
###     ${PYTHON_PKGNAMEPREFIX}anyascii>=0.3.2:textproc/py-anyascii@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	autoplist pep517 pytest

TEST_ARGS=	--cov --cov-report=term-missing

NO_ARCH=	yes

.include <bsd.port.mk>
