# Created by: Wen Heping <wenheping@gmail.com>

PORTNAME=	pg8000
PORTVERSION=	1.17.0
CATEGORIES=	databases python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pure-Python Interface to the PostgreSQL Database

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}passlib>=0:security/py-passlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}scramp>=0:security/py-scramp@${PY_FLAVOR}

USES=		python:3.5+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

.include <bsd.port.mk>
