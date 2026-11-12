PORTNAME=	flatbuffers
PORTVERSION=	25.12.19
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FlatBuffers serialization format for Python

LICENSE=	Apache-2.0
#LICENSE_FILE=	Not packaged in PyPI sdist

USES=		cpe python
CPE_VENDOR=	google
USE_PYTHON=	autoplist concurrent pep517

OPTIONS_DEFINE=	NUMPY

NUMPY_DESC=	Support scalar vectors as numpy arrays

NUMPY_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>0,1:math/py-numpy@${PY_FLAVOR}

MAKE_ENV+=	VERSION=${PORTVERSION}

NO_ARCH=	yes

DISTVERSIONPREFIX=	v

DISTVERSIONSUFFIX=	-2026-02-06-03fffb2

WRKSRC_SUBDIR=	python

USE_GITHUB=	yes

GH_ACCOUNT=	google

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

.include <bsd.port.mk>
