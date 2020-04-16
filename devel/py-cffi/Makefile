PORTNAME=	cffi
PORTVERSION=	1.13.2
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface for Python calling C code

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycparser>=0:devel/py-pycparser@${PY_FLAVOR}

USES=		compiler localbase python
USE_PYTHON=	autoplist concurrent distutils

# magus issues.
NO_TEST=	yes

.include <bsd.port.pre.mk>

.if ${COMPILER_TYPE} == clang
CFLAGS+=	-Wno-shift-negative-value
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_cffi_backend.so

.include <bsd.port.post.mk>
