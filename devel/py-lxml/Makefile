# Created by: Robert Gogolok <gogo@cs.uni-sb.de>
# $MidnightBSD$
# $FreeBSD: head/devel/py-lxml/Makefile 377589 2015-01-21 12:16:36Z wg $

PORTNAME=	lxml
PORTVERSION=	4.1.1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic binding for the libxml2 and libxslt libraries

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/doc/licenses/BSD.txt

LIB_DEPENDS=	libxml2.so:textproc/libxml2 \
		libxslt.so:textproc/libxslt

USES=		python uniquefiles:dirs
USE_PYTHON=	autoplist concurrent distutils

LDFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib

DOCS_FILES=	CHANGES.txt CREDITS.txt TODO.txt README.rst
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCS_FILES:S,^,${WRKSRC}/,} ${FAKE_DESTDIR}${DOCSDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} doc ${FAKE_DESTDIR}${DOCSDIR}

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR} \
	-name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
