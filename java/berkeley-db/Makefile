PORTNAME=	je
PORTVERSION=	7.5.11
PORTREVISION=	0
CATEGORIES=	java databases
MASTER_SITES=	http://download.oracle.com/berkeley-db/	\
		http://download-east.oracle.com/berkeley-db/	\
		http://download-west.oracle.com/berkeley-db/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Berkeley DB Java Edition
WWW=		https://www.oracle.com/database/technologies/related/berkeleydb.html

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${JAVALIBDIR}/junit.jar:java/junit

USES=		java:ant,run
JAVA_VERSION=	8

OPTIONS_DEFINE=	DOCS EXAMPLES

NO_TEST=	yes

MAKE_ENV+=	JAVALIBDIR="${JAVALIBDIR}"
MAKE_ARGS+=	-cp ${JAVALIBDIR}/junit.jar
EXTRACT_AFTER_ARGS+=	--exclude '*.jar'

PLIST_FILES=	${JAVAJARDIR:S,^${PREFIX}/,,}/je-${PORTVERSION}.jar \
		${JAVAJARDIR:S,^${PREFIX}/,,}/je.jar
PORTDOCS=	*
PORTEXAMPLES=	*

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} "s,/usr/local,${PREFIX}," ${WRKSRC}/build.xml
	${FIND} ${WRKSRC} -type f -name \*.java | ${XARGS} \
	    ${REINPLACE_CMD} -i "" -E 's,[^[:print:]]+, ,g'

do-install:
	${INSTALL_DATA} ${WRKSRC}/build/lib/je.jar ${STAGEDIR}${JAVAJARDIR}/je-${PORTVERSION}.jar
	${LN} -s -f je-${PORTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}/je.jar

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR})

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
