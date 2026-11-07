PORTNAME=	pycparser
PORTVERSION=	3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C parser in Python
WWW=		https://github.com/eliben/pycparser

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:78
USE_PYTHON=	allflavors autoplist concurrent pep517 unittest

NO_ARCH=	yes

.include <bsd.port.mk>
