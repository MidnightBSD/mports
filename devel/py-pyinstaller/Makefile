PORTNAME=	pyinstaller
DISTVERSION=	6.22.2
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	bsd.hsw@gmail.com
COMMENT=	Program to create standalone executables from Python scripts
WWW=		https://www.pyinstaller.org/

LICENSE=	Apache-2.0 gpl2+ mit
LICENSE_COMB=	multi
LICENSE_FILE=	${WRKSRC}/COPYING.txt

BUILD_DEPENDS=	py312-altgraph>0:math/py-altgraph@py312 \
		py312-packaging>0:devel/py-packaging@py312 \
		py312-setuptools>0:devel/py-setuptools@py312 \
		${PYTHON_PKGNAMEPREFIX}altgraph>0:math/py-altgraph@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}hatchling>0:devel/py-hatchling@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>0:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		py312-sphinx-autodoc-typehints>0:textproc/py-sphinx-autodoc-typehints@py312 \
		py312-sphinx-copybutton>0:textproc/py-sphinx-copybutton@py312 \
		py312-sphinx-inline-tabs>0:textproc/py-sphinx-inline-tabs@py312 \
		py312-sphinx-issues>0:textproc/py-sphinx-issues@py312 \
		py312-sphinx>0,1:textproc/py-sphinx@py312 \
		py312-sphinx_rtd_theme>0:textproc/py-sphinx_rtd_theme@py312 \
		py312-sphinxcontrib-towncrier>0:textproc/py-sphinxcontrib-towncrier@py312 \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}altgraph>0:math/py-altgraph@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pyinstaller-hooks-contrib>=2026.6:devel/py-pyinstaller-hooks-contrib@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=22:devel/py-packaging@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=42:devel/py-setuptools@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}execnet>0:sysutils/py-execnet@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}psutil>0:sysutils/py-psutil@${PY_FLAVOR}

USES=		cpe python:3.8-3.15
USE_PYTHON=	autoplist concurrent pep517 pytest

TEST_ARGS=	-rsfE --doctest-glob= -p no:legacypath

DOCSDIR=	${PREFIX}/share/doc/${PYTHON_PKGNAMEPREFIX}${PORTNAME}

PLIST_FILES=	share/man/man1/pyi-makespec.1.gz \
		share/man/man1/pyinstaller.1.gz

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

pre-build:
	cd ${WRKSRC}/bootloader && \
		${PYTHON_CMD} waf all

do-build-DOCS-on:
	(cd ${WRKSRC}/doc && \
		${SETENV} ${LOCALBASE}/bin/sphinx-build-3.12 -b html . _build/html)

post-build:
	(cd ${WRKSRC}/doc && \
		${SETENV} ${LOCALBASE}/bin/sphinx-build-3.12 -b man . _build/man)

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc/_build/html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "-not -name .buildinfo -not -regex ^./.doctrees.* -not -regex ^./_sources.*")

post-install:
	@${MKDIR} ${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/doc/_build/man/*.1 \
		${PREFIX}/share/man/man1

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} < 31000
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}importlib-metadata>=4.6:devel/py-importlib-metadata@${PY_FLAVOR}
.endif

.include <bsd.port.post.mk>
