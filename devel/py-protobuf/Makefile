# Created by: vanilla@

PORTNAME=	protobuf
PORTVERSION=	3.11.3
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Google protobuf Python Client Library

LICENSE=	bsd3

BUILD_DEPENDS=	protoc:devel/protobuf
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>=1.9:devel/py-six@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

DO_MAKE_TEST=	${PYTHON_CMD} ${PYDISTUTILS_SETUP}
NO_ARCH=	yes
TEST_TARGET=	test

.include <bsd.port.mk>
