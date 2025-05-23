PORTNAME=	antlr
PORTVERSION=	2.7.7
PORTREVISION=	4
CATEGORIES=	devel java
MASTER_SITES=	https://www.antlr2.org/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ANother Tool for Language Recognition
WWW=		https://www.antlr2.org/

LICENSE=	publicdom
LICENSE_FILE= ${WRKSRC}/LICENSE.txt

CONFLICTS=	pccts

USES=		compiler:c++11-lang gmake java
USE_CXXSTD=	c++14

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

OPTIONS_DEFINE=	DOCS

post-extract:
	(cd ${WRKSRC} && ${CP} antlr.jar antlrall.jar)

do-install:
	@${MKDIR} ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_DATA} ${WRKSRC}/antlr.jar ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/antlr.sh ${STAGEDIR}${PREFIX}/bin/antlr
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/lib/cpp/antlr/*.hpp \
		${STAGEDIR}${PREFIX}/include/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/lib/cpp/src/libantlr.a ${STAGEDIR}${PREFIX}/lib

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/doc && ${INSTALL_DATA} ${PORTDOCS} ${FAKE_DESTDIR}${DOCSDIR})

.include <bsd.port.mk>
