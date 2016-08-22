# Created by: Robert Gogolok <gogo@cs.uni-sb.de>
# $MidnightBSD$
# $FreeBSD: head/devel/py-lxml/Makefile 377589 2015-01-21 12:16:36Z wg $

PORTNAME=	lxml
PORTVERSION=	3.6.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Pythonic binding for the libxml2 and libxslt libraries

LICENSE=	bsd3

LIB_DEPENDS=	libxml2.so:${PORTSDIR}/textproc/libxml2 \
		libxslt.so:${PORTSDIR}/textproc/libxslt

USES=		python uniquefiles:dirs
USE_PYTHON=	autoplist concurrent distutils

LDFLAGS+=	-Wl,-rpath=${LOCALBASE}/lib

DOCS_FILES=	CHANGES.txt CREDITS.txt TODO.txt README.rst
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${DOCS_FILES:S,^,${WRKSRC}/,} ${DOCSDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} doc ${DOCSDIR}

.include <bsd.port.mk>
