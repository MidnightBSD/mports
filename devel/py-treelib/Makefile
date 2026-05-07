PORTNAME=	treelib
DISTVERSION=	1.7.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 2/3 implementation of tree structure
WWW=		https://treelib.readthedocs.io/en/latest/

LICENSE=	APACHE20

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.13.0:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
