# $MidnightBSD$

PORTNAME=	psycopg2
PORTVERSION=	2.7.5
CATEGORIES=	databases python
MASTER_SITES=	CHEESESHOP \
		http://initd.org/psycopg/tarballs/PSYCOPG-${PORTVERSION:R:S|.|-|}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance Python adapter for PostgreSQL

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/doc/COPYING.LESSER

OPTIONS_DEFINE=	DOCS EXAMPLES

USE_PYTHON=	autoplist concurrent distutils
USES=		pgsql python

PORTDOCS=	AUTHORS INSTALL NEWS PKG-INFO README.rst
PORTEXAMPLES=	*

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/psycopg2/_psycopg.so

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/ && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR}/

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
