PORTNAME=	jsondiff
PORTVERSION=	2.2.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Diff JSON and JSON-like structures in Python
WWW=		https://github.com/xlwings/jsondiff

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.8+ python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

CONFLICTS_INSTALL=	jojodiff py*-jsonpatch # bin/jdiff

NO_ARCH=	yes

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>=8:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=0:devel/py-pyyaml@${PY_FLAVOR}

.include <bsd.port.mk>
