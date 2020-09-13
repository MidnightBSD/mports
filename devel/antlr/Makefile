PORTNAME=	antlr
PORTVERSION=	2.7.7
PORTREVISION=	2
CATEGORIES=	devel java
MASTER_SITES=	http://www.antlr2.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ANother Tool for Language Recognition

LICENSE=	publicdom

BUILD_DEPENDS+=	javavm:java/javavmwrapper
RUN_DEPENDS+=	javavm:java/javavmwrapper

CONFLICTS=	pccts-[0-9]*

USES=		compiler:c++11-lang gmake
USE_JAVA=	yes

HAS_CONFIGURE=	yes
CONFIGURE_ENV=	JAVAC="${JAVAC}" JAR="${JAR}" JAVA="${JAVA}" CLASSPATH="${PORT_CLASSPATH}"
CONFIGURE_ARGS=	--disable-csharp --prefix=${PREFIX} \
		--build=${ARCH}-portbld-freebsd10.4 \
		--host=${ARCH}-portbld-freebsd10.4

PORT_CLASSPATH=	${WRKSRC}/antlrall.jar:.

SUB_FILES=	antlr.sh

PORTDOCS=	ANTLRException.gif closure.gif cpp-runtime.html \
		csharp-runtime.html err.html glossary.html hidden.stream.gif \
		index.html inheritance.html j-guru-blue.jpg jguru-logo.gif \
		lexer.html lexer.to.parser.tokens.gif logo.gif metalang.html \
		optional.gif options.html posclosure.gif runtime.html sor.html \
		stream.perspectives.gif stream.selector.gif \
		stream.splitter.gif streams.html subrule.gif trees.html \
		vocab.html

OPTIONS_DEFINE=	PYTHON DOCS
OPTIONS_SUB=	yes

PYTHON_USES=		python:2.7
PYTHON_PORTDOCS=	python-runtime.html

post-extract:
	(cd ${WRKSRC} && ${CP} antlr.jar antlrall.jar)

post-configure-PYTHON-on:
	(cd ${WRKSRC}/lib/python && ${PYTHON_CMD} setup.py config)

post-build-PYTHON-on:
	(cd ${WRKSRC}/lib/python && ${PYTHON_CMD} setup.py build && \
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py ${WRKSRC}/lib/python)

do-install:
	@${MKDIR} ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_DATA} ${WRKSRC}/antlr.jar ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/antlr.sh ${STAGEDIR}${PREFIX}/bin/antlr
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/lib/cpp/antlr/*.hpp \
		${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/lib/cpp/src/libantlr.a ${STAGEDIR}${PREFIX}/lib
	${MKDIR} ${DOCSDIR}
	(cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${DOCSDIR})

do-install-PYTHON-on:
	@(cd ${WRKSRC}/lib/python && ${PYTHON_CMD} setup.py install --root=${FAKE_DESTDIR})

.include <bsd.port.mk>
