PORTNAME=	xerces-j
PORTVERSION=	2.12.2
PORTREVISION=	1
CATEGORIES=	textproc java
MASTER_SITES=	https://archive.apache.org/dist/xerces/j/binaries/
DISTNAME=	Xerces-J-bin.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML parser for Java
WWW=		https://xerces.apache.org/xerces2-j/

LICENSE=	Apache-2.0

USES=		java
NO_BUILD=	yes
NO_ARCH=	yes

WRKSRC=		${WRKDIR}/xerces-${PORTVERSION:S/./_/g}

PORTDOCS=	*
PORTEXAMPLES=	*

JARFILES=	xercesImpl.jar xml-apis.jar

PLIST_FILES=	${JARFILES:S,^,%%JAVAJARDIR%%/,}

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	@${ECHO_MSG} -n ">> Installing JAR files in ${JAVAJARDIR}..."
.for JARFILE in ${JARFILES}
	@cd ${WRKSRC} && ${INSTALL_DATA} ${JARFILE} ${JAVAJARDIR}/${JARFILE}
	@${ECHO_MSG} -n " ${JARFILE}"
.endfor
	@${ECHO_MSG} " [ DONE ]"
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@(cd ${WRKSRC}/docs && ${COPYTREE_SHARE} \* ${STAGEDIR}${DOCSDIR})
	@${ECHO_MSG} " [ DONE ]"
	@${ECHO_MSG} -n ">> Installing samples in ${EXAMPLESDIR}..."
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC} && ${COPYTREE_SHARE} "data samples" ${STAGEDIR}${EXAMPLESDIR})
	@${ECHO_MSG} " [ DONE ]"

.include <bsd.port.mk>
