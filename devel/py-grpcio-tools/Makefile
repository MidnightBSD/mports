PORTNAME=	grpcio-tools
DISTVERSION=	1.85.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	grpcio_tools-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Protobuf code generator for gRPC
WWW=		https://pypi.org/project/grpcio-tools/

LICENSE=	Apache-2.0

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}grpcio>=1.85.1:devel/py-grpcio@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf>=7.35.1,1:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}protobuf<8,1:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=63.1.0:devel/py-setuptools@${PY_FLAVOR}
LIB_DEPENDS=	libcares.so:dns/c-ares

USES=		compiler:c++17-lang localbase:ldflags python:3.10+
USE_PYTHON=	autoplist distutils
CFLAGS+=	-DHAVE_PTHREAD=1
LDFLAGS+=	-lcares

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/grpc_tools/_protoc_compiler*.so

.include <bsd.port.mk>
