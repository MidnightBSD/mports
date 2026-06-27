PORTNAME=	tree-sitter
PORTVERSION=	0.25.2
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	pat@patmaddox.com
COMMENT=	Python bindings to the Tree-sitter parsing library
WWW=		https://github.com/tree-sitter/py-tree-sitter

LICENSE=	mit

USES=		python
USE_PYTHON=	allflavors autoplist concurrent pep517

post-install:
	${FIND} ${STAGEDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
