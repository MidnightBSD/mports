PORTNAME=	jsonpatch
DISTVERSION=	1.33
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apply JSON-Patches (RFC 6902)
WWW=		https://github.com/stefankoegl/python-json-patch

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}jsonpointer>0:devel/py-jsonpointer@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	py*-jsondiff # bin/jsondiff

NO_ARCH=	yes

do-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} tests.py
	@cd ${WRKSRC} && ${PYTHON_CMD} ext_tests.py

.include <bsd.port.mk>
