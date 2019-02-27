# $MidnightBSD$

PORTNAME=	ply
PORTVERSION=	3.11
CATEGORIES=	devel python
MASTER_SITES=	http://www.dabeaz.com/ply/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Lex-Yacc

LICENSE=	bsd3

USES=		python
USES+=		shebangfix
USE_PYTHON=	autoplist concurrent distutils
NO_ARCH=	yes
SHEBANG_FILES=	example/newclasscalc/calc.py \
		example/classcalc/calc.py

PORTDOCS=	ply.html internal.html

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local/bin/python|${python_CMD}|' \
	    ${WRKSRC}/example/yply/yply.py
	@${FIND} ${WRKSRC} -name \*.bak -delete

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/ply.html ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/internal.html ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC}/example && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR}

do-test:
	@cd ${WRKSRC}/test && ${PYTHON_CMD} testlex.py && ${PYTHON_CMD} testyacc.py

.include <bsd.port.mk>
