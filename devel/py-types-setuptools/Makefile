PORTNAME=	types-setuptools
PORTVERSION=	84.0.0.20260812
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	types_setuptools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for setuptools
WWW=		https://github.com/python/typeshed/tree/main/stubs/setuptools

LICENSE=	Apache-2.0

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	LICENSE_FILE=	${WRKSRC}/LICENSE

.include <bsd.port.mk>
