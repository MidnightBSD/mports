# $MidnightBSD$

PORTNAME=	ply
PORTVERSION=	3.6
CATEGORIES=	devel python
MASTER_SITES=	http://www.dabeaz.com/ply/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Lex-Yacc

LICENSE=	bsd3

USES=		python
USE_PYTHON=	autoplist concurrent distutils

PORTDOCS=	ply.html internal.html

OPTIONS_DEFINE=	DOCS EXAMPLES

post-extract:
	@${FIND} ${WRKSRC}/example -name "*.pyc" -type f -delete
	@${FIND} ${WRKSRC}/example -name "__pycache__" -type d -delete

pre-configure:
	@${REINPLACE_CMD} -e 's|from setuptools import setup|from distutils.core import setup|' \
		${WRKSRC}/setup.py

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/ply.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/internal.html ${DOCSDIR}
	@${MKDIR} ${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/example/ ${EXAMPLESDIR}

.include <bsd.port.mk>
