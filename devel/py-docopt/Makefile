# Created by: Antoine Brodin <antoine@FreeBSD.org>

PORTNAME=	docopt
PORTVERSION=	0.6.2
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic argument parser, that will make you smile

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE-MIT

NO_ARCH=	yes
USES=		python:3.6+
USE_PYTHON=	distutils autoplist concurrent

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	README.rst
PORTEXAMPLES=	*

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/examples && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
