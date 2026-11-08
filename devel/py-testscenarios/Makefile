PORTNAME=	testscenarios
PORTVERSION=	0.7.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PyUnit extension for dependency injection
WWW=		https://github.com/testing-cabal/testscenarios

LICENSE=	Apache-2.0 bsd3
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0=	${WRKSRC}/Apache-2.0
LICENSE_FILE_bsd3=	${WRKSRC}/BSD

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}testtools>=0:devel/py-testtools@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}testtools>=2.8.7:devel/py-testtools@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

do-test:
	cd ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} && \
		${SETENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC} \
		${TEST_ENV} \
		${PYTHON_CMD} -m testtools.run testscenarios.test_suite

.include <bsd.port.mk>
