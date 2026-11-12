PORTNAME=	types-python-dateutil
DISTVERSION=	2.9.0.20261021
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	types_python_dateutil-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for python-dateutil
WWW=		https://github.com/python/typeshed

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	pep517 autoplist

NO_ARCH=	yes

.include <bsd.port.mk>
