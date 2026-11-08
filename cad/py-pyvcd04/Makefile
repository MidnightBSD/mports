PORTNAME=	pyvcd
DISTVERSION=	0.4.2
CATEGORIES=	cad python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	04

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python VCD file support (legacy 0.4 series)
WWW=		https://pyvcd.readthedocs.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=45:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=6.3:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist pep517 pytest

CONFLICTS_INSTALL=	${PYTHON_PKGNAMEPREFIX}pyvcd \
			${PYTHON_PKGNAMEPREFIX}pyvcd-[0-9]*

NO_ARCH=	yes
TEST_ARGS=	tests --doctest-glob=*.rst

PORTSCOUT=	limit:^0\.4\.

.include <bsd.port.mk>
