PORTNAME=	defusedxml
PORTVERSION=	0.7.1
PORTREVISION=	1
CATEGORIES=	devel python textproc
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML bomb protection for Python stdlib modules
WWW=		https://github.com/tiran/defusedxml

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
NO_TEST=	yes
USES=		python
USE_PYTHON=	autoplist concurrent distutils

PORTDOCS=	*
DOCS_FILES=	CHANGES.txt README.txt

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS_FILES:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
