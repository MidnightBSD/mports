PORTNAME=	testtools
PORTVERSION=	2.9.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensions to the Python standard library unit testing framework
WWW=		https://github.com/testing-cabal/testtools

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=0:devel/py-hatchling@${PY_FLAVOR}

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fixtures>0:devel/py-fixtures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}twisted>0:devel/py-twisted@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testresources>0:devel/py-testresources@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}testscenarios>0:devel/py-testscenarios@${PY_FLAVOR}

USES=		python:3.10+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

PORTDOCS=	api.rst for-framework-folk.rst for-test-authors.rst hacking.rst index.rst news.rst overview.rst twisted-support.rst

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.rst ${FAKE_DESTDIR}${DOCSDIR}

do-test:
	cd ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} && \
		${SETENV} PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}:${WRKSRC} \
		${TEST_ENV} \
		${PYTHON_CMD} -m testtools.run tests.test_suite

.include <bsd.port.mk>
