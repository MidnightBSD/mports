# Created by: Martin Jackson <mhjacks@swbell.net>

PORTNAME=	pyasn1
PORTVERSION=	0.6.4
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ASN.1 toolkit for Python

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

USES=		cpe python:3.8+
USE_PYTHON=	allflavors autoplist pep517 unittest
NO_ARCH=	yes

TEST_ENV=	PYTHONDONTWRITEBYTECODE=1 PYTHONSAFEPATH=1
TEST_ARGS=	tests.__main__.suite

.include <bsd.port.mk>
