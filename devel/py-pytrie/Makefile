# Created by: Kubilay Kocak <koobs@FreeBSD.org>

PORTNAME=	pytrie
PORTVERSION=	0.3.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyTrie-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure Python implementation of the trie data structure

LICENSE=	bsd3
#LICENSE_FILE=	${WRKSRC}/LICENSE # Not packaged (yet) in sdist

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sortedcontainers>0:devel/py-sortedcontainers@${PY_FLAVOR}

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} test

.include <bsd.port.mk>
