PORTNAME=	pip
PORTVERSION=	26.2.2
CATEGORIES=	devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DIST_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for installing and managing Python packages
WWW=		https://pip.pypa.io/en/latest/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.11<4:devel/py-flit-core@${PY_FLAVOR}

USES=		cpe python:3.10+ shebangfix
CPE_VENDOR=	pypa
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes
NO_TEST=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	pypa

SHEBANG_FILES=	src/pip/__init__.py

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}furo>=0:textproc/py-furo@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}myst-parser>=0:textproc/py-myst-parser@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx>=7.0,1<8.0,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-copybutton>=0:textproc/py-sphinx-copybutton@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-inline-tabs>=0:textproc/py-sphinx-inline-tabs@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx-issues>=4.0:textproc/py-sphinx-issues@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinxcontrib-towncrier>=0.2.0a0:textproc/py-sphinxcontrib-towncrier@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}towncrier>=0:textproc/py-towncrier@${PY_FLAVOR}
DOCS_PORTDOCS=		*

post-build-DOCS-on:
	(cd ${WRKSRC} && ${SETENV} PYTHONPATH=${WRKSRC}/src \
	${PYTHON_CMD} -m sphinx --tag html -c docs/html -b html \
	docs/html docs/build/html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/build/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
