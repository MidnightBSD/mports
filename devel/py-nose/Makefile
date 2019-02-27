PORTNAME=	nose
PORTVERSION=	1.3.7
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Discovery-based unittest extension

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/lgpl.txt

USES=		python
USE_PYTHON=	autoplist concurrent distutils

.include <bsd.port.pre.mk>

do-test:
# Extra tests for python 3, added in by setup3lib.py
.if ${PYTHON_REL} >= 3000
	@cd ${WRKSRC} && ${PYTHON_CMD} ${PYDISTUTILS_SETUP} build_tests
.endif
	@cd ${WRKSRC} && ${PYTHON_CMD} selftest.py

.include <bsd.port.post.mk>
