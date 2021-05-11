PORTNAME=	flatbuffers
PORTVERSION=	1.11
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FlatBuffers serialization format for Python

LICENSE=	apache2
#LICENSE_FILE=	Not packaged in PyPI sdist

USES=		python:3.6+
USE_PYTHON=	autoplist distutils

OPTIONS_DEFINE=	NUMPY

NUMPY_DESC=	Support scalar vectors as numpy arrays

NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>0:math/py-numpy@${PY_FLAVOR}

MAKE_ENV+=	VERSION=${PORTVERSION}

NO_ARCH=	yes

.include <bsd.port.mk>
