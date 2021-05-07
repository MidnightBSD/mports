# Created by: Nicola Vitale <nivit@FreeBSD.org>

PORTNAME=	cssselect
PORTVERSION=	1.1.0
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cssselect parses CSS3 Selectors and translates them to XPath 1.0

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.6+
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

OPTIONS_DEFINE=	DOCS

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR}

DOCSDIR=	${PREFIX}/share/doc/${PKGNAMEPREFIX}${PORTNAME}

PORTDOCS=	*

post-build-DOCS-on:
	(cd ${WRKSRC} && \
		PYTHONPATH=${WRKSRC} sphinx-build-${PYTHON_VER} -N -a docs docs.html)

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs.html && \
		${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! -name .buildinfo -and ! -path *doctrees*")

.include <bsd.port.mk>
