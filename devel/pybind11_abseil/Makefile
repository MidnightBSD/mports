PORTNAME=	pybind11_abseil
PORTVERSION=	202402.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://github.com/pybind/pybind11_abseil/releases/download/v${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pybind11 bindings for the Abseil C++ Common Libraries
WWW=		https://github.com/pybind/pybind11_abseil

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	abseil>=0:devel/abseil \
		pybind11>=0:devel/pybind11
LIB_DEPENDS=	libabsl_base.so:devel/abseil

USES=		cmake compiler:c++17-lang python:build

CMAKE_ARGS=	-DCMAKE_INSTALL_PYDIR=${PYTHON_SITELIBDIR}

.include <bsd.port.mk>
