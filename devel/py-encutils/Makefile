PORTNAME=	encutils
PORTVERSION=	1.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Encoding detection collection for Python
WWW=		https://cthedot.de/encutils/ \
		https://github.com/coherent-oss/encutils

LICENSE=	lgpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<4:devel/py-flit-core@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}chardet>=0,1:textproc/py-chardet@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517 pytest

NO_ARCH=	yes

# Flit includes package data; retain patch backups outside the wheel.
post-patch:
	@${MV} ${WRKSRC}/encutils/__init__.py.orig ${WRKDIR}/encutils-init.py.orig

.include <bsd.port.mk>
