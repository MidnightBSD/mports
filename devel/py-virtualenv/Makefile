PORTNAME=	virtualenv
PORTVERSION=	21.14.13
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for creating isolated Python environments
WWW=		https://virtualenv.pypa.io

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatch-vcs>=0.5:devel/py-hatch-vcs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>=1.28:devel/py-hatchling@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}distlib>=0.4.3<1:devel/py-distlib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}filelock>=3.24.2<5:sysutils/py-filelock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=26.3:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}platformdirs>=4.4<5:devel/py-platformdirs@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}python-discovery>=1.6.1:devel/py-python-discovery@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}covdefaults>=2.3:devel/py-covdefaults@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage>=7.10.7:devel/py-coverage@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}coverage_enable_subprocess>=1.0:devel/py-coverage_enable_subprocess@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>=8.4.2:devel/py-pytest@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-env>=1.1.5:devel/py-pytest-env@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-mock>=3.15.1:devel/py-pytest-mock@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-randomly>=4.0.1:devel/py-pytest-randomly@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-rerunfailures>=16.0.1:devel/py-pytest-rerunfailures@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-timeout>=2.4:devel/py-pytest-timeout@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest-xdist>=3.8:devel/py-pytest-xdist@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-modern>=84.2.1:devel/py-setuptools-modern@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}time-machine>=2.19:devel/py-time-machine@${PY_FLAVOR}

USES=		cpe pytest python:3.12+
USE_GITHUB=	yes
GH_ACCOUNT=	pypa
USE_PYTHON=	autoplist concurrent pep517 pytest

PYTEST_ARGS=	--int -n auto --dist loadfile
MAKE_ENV=	SETUPTOOLS_SCM_PRETEND_VERSION="${PORTVERSION}"
TEST_ENV=	PYTHONIOENCODING=utf-8 \
		SETUPTOOLS_SCM_PRETEND_VERSION="${PORTVERSION}" \
		PYTHONPATH="${FAKE_DESTDIR}${PYTHON_SITELIBDIR}:${PYTHONPREFIX_LIBDIR}/mports-setuptools/modern"

NO_ARCH=	yes
# Existing test policy retained; tcsh GBK prompt failures are documented in the PR.
NO_TEST=	yes

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}furo>=2025.12.19:textproc/py-furo@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-argparse>=0.4:textproc/py-sphinx-argparse@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx>=9.1.1,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-autodoc-typehints>=3.6.2:textproc/py-sphinx-autodoc-typehints@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-copybutton>=0.5.2:textproc/py-sphinx-copybutton@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-inline-tabs>=2025.12.21.14:textproc/py-sphinx-inline-tabs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-llm>=1.0.0<1.1:textproc/py-sphinx-llm@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinxcontrib-mermaid>=2.0.0:textproc/py-sphinxcontrib-mermaid@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinxcontrib-towncrier>=0.2.1a0:textproc/py-sphinxcontrib-towncrier@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}towncrier>=26.9:textproc/py-towncrier@${PY_FLAVOR}
DOCS_BINARY_ALIAS=	towncrier=towncrier-${PYTHON_VER}
DOCS_PLIST_FILES=	share/man/man1/virtualenv.1.gz
DOCS_PORTDOCS=	* .buildinfo

post-install-DOCS-on:
	${SETENV} ${MAKE_ENV} PYTHONPATH="${FAKE_DESTDIR}${PYTHON_SITELIBDIR}" \
		${LOCALBASE}/bin/sphinx-build-${PYTHON_VER} \
		-d ${WRKDIR} -b html -n ${WRKSRC}/docs ${FAKE_DESTDIR}${DOCSDIR}
	${SETENV} ${MAKE_ENV} PYTHONPATH="${FAKE_DESTDIR}${PYTHON_SITELIBDIR}" \
		${LOCALBASE}/bin/sphinx-build-${PYTHON_VER} \
		-d ${WRKDIR} -b man -n ${WRKSRC}/docs ${FAKE_DESTDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
