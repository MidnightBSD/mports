PORTNAME=	xalan-j
PORTVERSION=	2.7.3
CATEGORIES=	textproc java
MASTER_SITES=	APACHE/xalan/xalan-j/binaries
DISTNAME=	${PORTNAME}_${PORTVERSION:S/./_/g}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache XSLT processor for transforming XML documents
WWW=		https://xml.apache.org/xalan-j/

LICENSE=	Apache-2.0

RUN_DEPENDS=	${JAVALIBDIR}/xml-apis.jar:textproc/xerces-j

USES=		cpe java
CPE_PRODUCT=	xalan-java
CPE_VENDOR=	apache
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION:S/./_/g}

PORTDOCS=	*
PORTEXAMPLES=	*

JARFILES=	xalan.jar serializer.jar

PLIST_FILES=	${JARFILES:S|^|%%JAVAJARDIR%%/|} bin/xalan-j

SUB_FILES=	xalan-j.sh

do-install:
	@${ECHO_MSG} -n ">> Installing JAR files in ${JAVAJARDIR}..."
.for jarfile in ${JARFILES}
	@${INSTALL_DATA} ${WRKSRC}/${jarfile} ${JAVAJARDIR}/
	@${ECHO_MSG} -n " ${jarfile}"
.endfor
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${DOCSDIR})
	@${ECHO_MSG} " [ DONE ]"
.endif
.if !defined(NOPORTEXAMPLES)
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${EXAMPLESDIR}
	@(cd ${WRKSRC}/samples && ${COPYTREE_SHARE} \* ${EXAMPLESDIR})
	@${ECHO_MSG} " [ DONE ]"
.endif
	@${ECHO_MSG} -n ">> Installing script in ${PREFIX}/bin/..."
	@${INSTALL_SCRIPT} ${WRKDIR}/xalan-j.sh ${PREFIX}/bin/xalan-j
	@${ECHO_MSG} " [ DONE ]"

.include <bsd.port.mk>
