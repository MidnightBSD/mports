# Created by: Alexey V. Degtyarev <alexey@renatasystems.org>

PORTNAME=	jmespath
PORTVERSION=	1.1.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI \
		https://codeload.github.com/jmespath/jmespath.py/tar.gz/refs/tags/${PORTVERSION}?filename=/:tests
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} ${PORTNAME}-${PORTVERSION}-tests.tar.gz:tests
DIST_SUBDIR=	jmespath
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON Matching Expressions
WWW=		https://github.com/jmespath/jmespath.py

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>=8,1:devel/py-pytest@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	@${MKDIR} ${WRKDIR}/upstream-tests
	@${TAR} -xzf ${DISTDIR}/${DIST_SUBDIR}/${PORTNAME}-${PORTVERSION}-tests.tar.gz -C ${WRKDIR}/upstream-tests --strip-components 1 jmespath.py-${PORTVERSION}/tests
	@(cd ${WRKDIR}/upstream-tests && ${SETENV} HOME=${WRKDIR} PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=${FAKE_DESTDIR}${PYTHON_SITELIBDIR} ${PYTHON_CMD} -m pytest tests)

.include <bsd.port.mk>
