# $MidnightBSD$

PORTNAME=	lz4
PORTVERSION=	1.1.0
CATEGORIES=	archivers python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python binding for the LZ4 compression library

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	liblz4>=1.7.5:archivers/liblz4 \
		${PYTHON_PKGNAMEPREFIX}pkgconfig>=0:devel/py-pkgconfig \
		${PYTHON_PKGNAMEPREFIX}pytest-runner>=0:devel/py-pytest-runner \
		${PYTHON_PKGNAMEPREFIX}setuptools_scm>0:devel/py-setuptools_scm
LIB_DEPENDS=	liblz4.so:archivers/liblz4
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=0:devel/py-pytest

USE_PYTHON=	distutils py3kplist
USES=		python

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/_version.so \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/block/_block.so \
		${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/${PORTNAME}/frame/_frame.so

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 3000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}future>=0:devel/py-future
.endif

.include <bsd.port.post.mk>
