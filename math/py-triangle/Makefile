PORTNAME=	triangle
DISTVERSIONPREFIX=	v
DISTVERSION=	20250106
CATEGORIES=	math
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python interface to triangle
WWW=		https://rufat.be/triangle

LICENSE=	lgpl3 triangle
LICENSE_COMB=	multi
LICENSE_NAME_triangle=	Triangle noncommercial redistribution license
LICENSE_FILE_lgpl3=	${WRKSRC}/LICENSE
LICENSE_FILE_triangle=	${WRKSRC}/c/triangle.c
LICENSE_PERMS_triangle=	dist-mirror pkg-mirror auto-accept

USES=		compiler:c++11-lang python:3.7+

USE_GITHUB=	yes
GH_ACCOUNT=	drufat
GH_TUPLE=	drufat:triangle-c:8b9e104:triangle/c
USE_PYTHON=	autoplist concurrent cython pep517

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cython>=3.0.2:lang/cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=61:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR} \
		triangle>0:math/triangle

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/triangle/core*.so

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>0,1:math/py-numpy@${PY_FLAVOR}

.include <bsd.port.mk>
