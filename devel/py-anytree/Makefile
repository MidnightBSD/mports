PORTNAME=	anytree
DISTVERSION=	2.12.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Powerful and Lightweight Python Tree Data Structure
WWW=		https://github.com/c0fec0de/anytree/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}poetry-core>=0:devel/py-poetry-core@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}nose>0:devel/py-nose@${PY_FLAVOR} \
		dot:graphics/graphviz

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

# test_tree_png runs `dot` and returns "Error: Could not find/open font"
# exclude it for now
do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m pytest -v -rs -o addopts= \
	-k 'not test_tree_png'

.include <bsd.port.mk>
