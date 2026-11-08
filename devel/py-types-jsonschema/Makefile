PORTNAME=	types-jsonschema
PORTVERSION=	4.26.0.20261006
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for jsonschema
WWW=		https://pypi.org/project/types-jsonschema/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}referencing>=0:devel/py-referencing@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist pep517
NO_ARCH=	yes

DISTNAME=	types_jsonschema-${PORTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
