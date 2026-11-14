PORTNAME=	contourpy
PORTVERSION=	1.4.0
CATEGORIES=	math python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python library for calculating contours of 2D quadrilateral grids
WWW=		https://github.com/contourpy/contourpy

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pybind11>=2.13.2:devel/py-pybind11@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}meson-python>=0.18.0,1:devel/meson-python@${PY_FLAVOR} \
		meson:devel/meson
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}numpy>=2.0,1:math/py-numpy@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}matplotlib>=0:math/py-matplotlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wurlitzer>=0:devel/py-wurlitzer@${PY_FLAVOR}

USES=		compiler:c++17-lang localbase pkgconfig python:3.12+
USE_PYTHON=	autoplist concurrent pep517 pytest

BINARY_ALIAS=	pybind11-config=pybind11-config-${PYTHON_VER}

.include <bsd.port.mk>
