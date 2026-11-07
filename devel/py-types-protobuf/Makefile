PORTNAME=	types-protobuf
PORTVERSION=	7.35.1.20260906
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	types_protobuf-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for protobuf
WWW=		https://github.com/python/typeshed/tree/main/stubs/protobuf

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
