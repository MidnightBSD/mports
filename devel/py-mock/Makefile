# Created by: jessekempf@gmail.com

PORTNAME=	mock
PORTVERSION=	3.0.5
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Rolling backport of unittest.mock for all Pythons

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}

USES=		python:3.6+
USE_GITHUB=	yes # tests not packages in PyPI sdist
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

GH_ACCOUNT=	testing-cabal

.include <bsd.port.mk>
