PORTNAME=	pycoin
PORTVERSION=	0.92718.20260405
CATEGORIES=	finance
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utilities for Bitcoin and altcoin addresses/transaction manipulation
WWW=		https://github.com/richardkiss/pycoin

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.5.0:devel/py-setuptools-scm@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

CONFLICTS_INSTALL=	block keychain

NO_ARCH=	yes

.include <bsd.port.mk>
