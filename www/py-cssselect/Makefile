PORTNAME=	cssselect
PORTVERSION=	1.5.0
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cssselect parses CSS3 Selectors and translates them to XPath 1.0
WWW=		https://github.com/scrapy/cssselect

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}hatchling>=1.27.0:devel/py-hatchling@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist pep517 pytest

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}
NO_ARCH=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}

post-build-DOCS-on:
	(cd ${WRKSRC} && \
		PYTHONPATH=${WRKSRC} sphinx-build-${PYTHON_VER} -N -a docs docs.html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs.html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -path *doctrees*")

.include <bsd.port.mk>
