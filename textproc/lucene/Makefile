PORTNAME=	lucene
PORTVERSION=	3.6.2
# Be sure to chase textproc/py-lucene
CATEGORIES=	textproc java devel
MASTER_SITES=	https://archive.apache.org/dist/${PORTNAME}/java/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-text search engine for Java
WWW=		https://lucene.apache.org/core/

LICENSE=	apache2

CONFLICTS=	lucene4-[0-9].*

PORTSCOUT=	limit:^3\.

USES=		cpe java tar:tgz
NO_BUILD=	yes
CPE_VENDOR=	apache

OPTIONS_DEFINE=	CONTRIB DOCS EXAMPLES
CONTRIB_DESC=	Install contributed jars
OPTIONS_DEFAULT=	CONTRIB

PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}-core-${PORTVERSION}.jar

.include <bsd.mport.options.mk>

CONTRIBS=	benchmark \
		demo \
		facet	\
		grouping \
		highlighter \
		icu \
		instantiated \
		join	\
		memory \
		misc \
		pruning \
		queries \
		queryparser	\
		remote	\
		spatial \
		spellchecker \
		xml-query-parser

EXTRA_CONTRIBS_BASE=	analyzers

EXTRA_CONTRIBS_DIRS=	kuromoji \
		phonetic \
		smartcn \
		stempel

.if ${PORT_OPTIONS:MCONTRIB}
.for f in ${EXTRA_CONTRIBS_BASE} ${CONTRIBS} ${EXTRA_CONTRIBS_DIRS}
PLIST_FILES+=%%JAVAJARDIR%%/${PORTNAME}-${f}-${PORTVERSION}.jar
.endfor
.endif

PORTDOCS=	*
PORTEXAMPLES=	*

DEMODIR=	contrib/demo

do-install:
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-core-${PORTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}
.if ${PORT_OPTIONS:MCONTRIB}
. for f in ${CONTRIBS}
	${INSTALL_DATA} ${WRKSRC}/contrib/${f}/${PORTNAME}-${f}-${PORTVERSION}.jar ${STAGEDIR}${JAVAJARDIR}
. endfor
. for d in ${EXTRA_CONTRIBS_DIRS}
	${INSTALL_DATA} ${WRKSRC}/contrib/${EXTRA_CONTRIBS_BASE}/${d}/${PORTNAME}-${d}-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}
. endfor
	${INSTALL_DATA} \
		${WRKSRC}/contrib/${EXTRA_CONTRIBS_BASE}/common/${PORTNAME}-${EXTRA_CONTRIBS_BASE}-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}
.endif

	@${MKDIR} ${STAGEDIR}${DOCSDIR}
.for i in CHANGES.txt LICENSE.txt NOTICE.txt README.txt
	${INSTALL_DATA} ${WRKSRC}/${i} ${STAGEDIR}${DOCSDIR}
.endfor
	(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${STAGEDIR}${DOCSDIR} "-not -empty")
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/${DEMODIR} && ${COPYTREE_SHARE} \* ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
