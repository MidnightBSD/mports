PORTNAME=	types-psutil
PORTVERSION=	7.2.2.20260906
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for psutil
WWW=		https://github.com/python/typeshed/tree/main/stubs/psutil

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

DISTNAME=	types_psutil-${PORTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
