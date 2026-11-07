PORTNAME=	uritools
PORTVERSION=	6.1.3
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RFC 3986 compliant, Unicode-aware, scheme-agnostic replacement for urlparse
WWW=		https://uritools.readthedocs.io/en/stable/ \
		https://github.com/tkem/uritools

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8.2:devel/py-setuptools-scm@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517 unittest

NO_ARCH=	yes
TEST_ARGS=	discover -s tests

.include <bsd.port.mk>
