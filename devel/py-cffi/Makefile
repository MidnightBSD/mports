# $MidnightBSD$
# $FreeBSD: head/devel/py-cffi/Makefile 420385 2016-08-18 05:41:51Z marino $

PORTNAME=	cffi
PORTVERSION=	1.11.5
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface for Python calling C code

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libffi.so:devel/libffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycparser>=2.10:devel/py-pycparser@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

# Actually 2.6-2.7,3.2-3.5
USES=		localbase python compiler
USE_PYTHON=	autoplist distutils

.include <bsd.port.pre.mk>

.if ${OPSYS} == FreeBSD && ${OSVERSION} >= 1100000
.if ${COMPILER_TYPE:Mclang}
CFLAGS+=	-Wno-shift-negative-value
.endif
.endif

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_cffi_backend.so

do-test:
	@(cd ${TEST_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} \
		${PYDISTUTILS_SETUP} build_ext -i)
	@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -rs)

.include <bsd.port.post.mk>
