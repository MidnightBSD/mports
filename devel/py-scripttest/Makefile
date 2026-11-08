PORTNAME=	scripttest
PORTVERSION=	3.0
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helper to test command-line scripts
WWW=		https://github.com/pypa/scripttest

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/docs/license.rst

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<5:devel/py-flit-core@${PY_FLAVOR}

USES=		python:3.8+
USE_PYTHON=	autoplist pep517
NO_ARCH=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	pypa

NO_TEST=	yes

.include <bsd.port.mk>
