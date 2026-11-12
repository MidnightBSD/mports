PORTNAME=	librt
PORTVERSION=	0.16.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mypyc runtime library
WWW=		https://github.com/python/mypy/tree/master/mypyc/lib-rt \
		https://github.com/mypyc/librt

LICENSE=	mit python bsd2
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.9+ python-setuptools:78
USE_PYTHON=	autoplist concurrent pep517

.include <bsd.port.mk>
