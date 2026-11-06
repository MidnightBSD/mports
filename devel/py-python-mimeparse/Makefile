# Created by: William Grzybowski

PORTNAME=	python-mimeparse
PORTVERSION=	2.0.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic functions for handling mime-types in Python

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	cd ${WRKSRC} && ${PYTHON_CMD} mimeparse_test.py

DISTNAME=	python_mimeparse-${PORTVERSION}

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=47:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.34:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
