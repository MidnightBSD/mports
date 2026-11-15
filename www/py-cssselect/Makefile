PORTNAME=	cssselect
PORTVERSION=	1.6.0
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cssselect parses CSS3 Selectors and translates them to XPath 1.0
WWW=		https://github.com/scrapy/cssselect

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.28.0:devel/py-hatchling@${PY_FLAVOR}
TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=4.4:devel/py-lxml@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist pep517 pytest

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
NO_ARCH=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	py312-sphinx>=0,1:textproc/py-sphinx@py312 \
			py312-sphinx_rtd_theme>=1.0.0:textproc/py-sphinx_rtd_theme@py312

post-build-DOCS-on:
	(cd ${WRKSRC} && \
		PYTHONPATH=${WRKSRC} sphinx-build-3.12 -N -a docs docs.html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs.html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -path *doctrees*")

.include <bsd.port.mk>
