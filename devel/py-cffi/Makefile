# $MidnightBSD$
# $FreeBSD: head/devel/py-cffi/Makefile 420385 2016-08-18 05:41:51Z marino $

PORTNAME=	cffi
PORTVERSION=	1.7.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Foreign Function Interface for Python calling C code

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libffi.so:${PORTSDIR}/devel/libffi
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pycparser>=2.10:${PORTSDIR}/devel/py-pycparser
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:${PORTSDIR}/devel/py-pytest

# Actually 2.6-2.7,3.2-3.5
USES=		localbase python
USE_PYTHON=	autoplist distutils

.include <bsd.port.pre.mk>

# Tests assume gcc, and fail on pure clang systems
# Fixed in https://bitbucket.org/cffi/cffi/issues/271
post-patch:
	${REINPLACE_CMD} -e 's|gcc|${CC}|g' ${WRKSRC}/testing/cffi0/test_ownlib.py

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/_cffi_backend.so

do-test:
	@(cd ${TEST_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} \
		${PYDISTUTILS_SETUP} build_ext -i)
	@(cd ${TEST_WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -rs)

.include <bsd.port.post.mk>
