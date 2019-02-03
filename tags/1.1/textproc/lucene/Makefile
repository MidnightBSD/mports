# Created by: Gerrit Beine <gerrit.beine@gmx.de>
# $FreeBSD: head/textproc/lucene/Makefile 386312 2015-05-14 10:15:04Z mat $
# $MidnightBSD$

PORTNAME=	lucene
PORTVERSION=	3.6.2
# Be sure to chase textproc/py-lucene
CATEGORIES=	textproc java devel
MASTER_SITES=	APACHE/${PORTNAME}/java/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-text search engine for Java

LICENSE=	apache2

CONFLICTS=	lucene4-[0-9].*

USES=		tar:tgz
USE_JAVA=	yes
NO_BUILD=	yes
JAVA_VERSION=	1.6+

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
	(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${STAGEDIR}${DOCSDIR})
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	(cd ${WRKSRC}/${DEMODIR} && ${COPYTREE_SHARE} \* ${STAGEDIR}${EXAMPLESDIR})

.include <bsd.port.mk>
