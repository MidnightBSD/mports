PORTNAME=	grpcio
PORTVERSION=	1.59.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP/2-based RPC framework
WWW=		https://pypi.org/project/grpcio/

LICENSE=	Apache-2.0

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}protobuf>=3:devel/py-protobuf@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>1:devel/py-six@${PY_FLAVOR}
LIB_DEPENDS=	libcares.so:dns/c-ares

USES=		compiler:c++11-lib localbase:ldflags python ssl
USE_PYTHON=	autoplist cython distutils
MAKE_ENV+=	GRPC_PYTHON_BUILD_SYSTEM_CARES=true \
		GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true \
		GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true
LDFLAGS+=	-lcares

post-patch:
	@${RM} ${WRKSRC}/src/python/grpcio/grpc/_cython/cygrpc.cpp

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/grpc/_cython/cygrpc*.so
	${REINPLACE_CMD} -e 's|^.*so$$|${PYTHONPREFIX_SITELIBDIR}/grpc/_cython/cygrpc${PYTHON_TAG}.so|' ${_PYTHONPKGLIST}

.include <bsd.port.mk>
