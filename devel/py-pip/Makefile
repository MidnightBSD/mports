PORTNAME=	pip
PORTVERSION=	26.2.2
PORTREVISION=	1
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

DOCS_BUILD_DEPENDS=	py312-furo>=0:textproc/py-furo@py312 \
			py312-myst-parser>=5.1.0:textproc/py-myst-parser@py312 \
			py312-sphinx>=9.1.1,1<10,1:textproc/py-sphinx@py312 \
			py312-sphinx-copybutton>=0:textproc/py-sphinx-copybutton@py312 \
			py312-sphinx-inline-tabs>=0:textproc/py-sphinx-inline-tabs@py312 \
			py312-sphinx-issues>=4.0:textproc/py-sphinx-issues@py312 \
			py312-sphinxcontrib-towncrier>=0.5.0a0:textproc/py-sphinxcontrib-towncrier@py312 \
			py312-towncrier>=26.9.0:textproc/py-towncrier@py312
DOCS_PORTDOCS=		*

post-build-DOCS-on:
	(cd ${WRKSRC} && ${SETENV} PYTHONPATH=${WRKSRC}/src \
	${LOCALBASE}/bin/python3.12 -m sphinx --tag html -c docs/html -b html \
	-d ${WRKDIR}/sphinx-doctrees \
	docs/html docs/build/html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/build/html && \
	${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -name objects.inv")

.include <bsd.port.mk>
