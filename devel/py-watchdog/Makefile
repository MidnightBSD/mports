PORTNAME=	watchdog
DISTVERSION=	4.0.2
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python API library to monitor file system events
WWW=		https://github.com/gorakhargosh/watchdog

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=63.1.0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0.42.0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libinotify.so:devel/libinotify
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyyaml>=3.10:devel/py-pyyaml@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}eventlet>0:net/py-eventlet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flake8>0:devel/py-flake8@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}flaky>0:devel/py-flaky@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}isort>=5.13.2:devel/py-isort@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}mypy>=1.8.0:devel/py-mypy@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-cov>0:devel/py-pytest-cov@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>0:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>0:textproc/py-sphinx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}types-PyYAML>=6.0.12.12:devel/py-types-PyYAML@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517 

# NotImplementedError: unsupported platform
# site-packages/trio/_core/_run.py:2843: NotImplementedError
PYTEST_IGNORED_TESTS=	test_eventlet_monkey_patching
# FileNotFoundError: [Errno 2] No such file or directory: /tmp/tmp*
# src/watchdog/utils/dirsnapshot.py:318: FileNotFoundError
PYTEST_BROKEN_TESTS=	test_observers_polling
# tests: 144 passed, 11 skipped, 3 deselected
TEST_ENV=	PYTHONPATH=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

NO_ARCH=	yes
NO_TEST=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}

post-build-DOCS-on:
	(cd ${WRKSRC}/docs ; ${MAKE_CMD} SPHINXBUILD=sphinx-build-${PYTHON_VER} html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/build/html ; \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "-not -name .buildinfo")

.include <bsd.port.mk>
