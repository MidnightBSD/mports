PORTNAME=	types-pytz
DISTVERSION=	2026.5.0.20261006
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S/-/_/}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Typing stubs for pytz
WWW=		https://github.com/python/typeshed

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.10+ python-setuptools:83
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
