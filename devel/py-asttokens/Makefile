PORTNAME=	asttokens
PORTVERSION=	2.4.1
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Annotate AST trees with source code positions
WWW=		https://pypi.org/project/asttokens/ \
		https://github.com/gristlabs/asttokens

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=0:devel/py-six@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}astroid>=0:devel/py-astroid@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist distutils pytest
TEST_ARGS=	--ignore=tests/testdata
NO_ARCH=	yes

.include <bsd.port.mk>
