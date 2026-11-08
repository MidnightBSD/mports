PORTNAME=	asttokens
PORTVERSION=	3.0.2
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Annotate AST trees with source code positions
WWW=		https://pypi.org/project/asttokens/ \
		https://github.com/gristlabs/asttokens

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.3:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=44:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}astroid>=2<5:devel/py-astroid@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 pytest
TEST_ARGS=	--ignore=tests/testdata
NO_ARCH=	yes

OPTIONS_DEFINE=	ASTROID
ASTROID_DESC=	Annotate trees built by astroid

ASTROID_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}astroid>=2<5:devel/py-astroid@${PY_FLAVOR}

.include <bsd.port.mk>
