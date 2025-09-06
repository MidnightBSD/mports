PORTNAME=	uvloop
PORTVERSION=	0.21.0
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast drop-in replacement of asyncio event loop based on libuv
WWW=		https://github.com/MagicStack/uvloop

LICENSE=	Apache-2.0 mit
LICENSE_COMB=	dual
LICENSE_FILE_Apache-2.0 =	${WRKSRC}/LICENSE-APACHE
LICENSE_FILE_mit=	${WRKSRC}/LICENSE-MIT

USES=		python
USE_PYTHON=	autoplist concurrent distutils

OPTIONS_DEFINE=	DOCS EXAMPLES

PORTDOCS=	*
PORTEXAMPLES=	*

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/uvloop/loop*.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} PKG-INFO README.rst ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/docs &&  ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR}/

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
