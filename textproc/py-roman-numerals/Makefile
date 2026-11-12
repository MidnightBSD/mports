PORTNAME=	roman-numerals
PORTVERSION=	4.1.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	roman_numerals-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manipulate well-formed Roman numerals
WWW=		https://github.com/AA-Turner/roman-numerals

LICENSE=	bsd0 CC0-1.0
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENCE.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.12<4:devel/py-flit-core@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=9,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

.include <bsd.port.mk>
