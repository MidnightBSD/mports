PORTNAME=	pymtl
DISTVERSIONPREFIX=v
DISTVERSION=	3.1.17
CATEGORIES=	cad python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	${PORTVERSION:R:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python-based hardware generation, simulation, verification framework
WWW=		https://github.com/pymtl/pymtl3

LICENSE=	bsd3

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}greenlet>0:devel/py-greenlet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hypothesis>=4.18.1:devel/py-hypothesis@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}py>0:devel/py-py@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}graphviz>0:graphics/py-graphviz@${PY_FLAVOR} \
		verilator:cad/verilator \
		yosys:cad/yosys

USES=		python
USE_PYTHON=	autoplist distutils pytest

USE_GITHUB=	yes
GH_ACCOUNT=	pymtl
GH_PROJECT=	pymtl3

TEST_ARGS=	--disable-plugin-autoload -p pytest_plugin.pytest_pymtl3

# Tests as of 3.1.17: 1934 passed, 20 xfailed, 62395 warnings in 5104s.

BINARY_ALIAS=	g++=${CXX}

NO_ARCH=	yes

.include <bsd.port.mk>
