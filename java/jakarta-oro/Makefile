PORTNAME=	jakarta-oro
PORTVERSION=	2.0.8
PORTREVISION=	1
CATEGORIES=	java
MASTER_SITES=	http://archive.apache.org/dist/jakarta/oro/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl/awk/sh regular expressions for Java
WWW=		https://jakarta.apache.org/oro/

LICENSE=	Apache-1.1

USES=		java:ant,run

PLIST=	${WRKDIR}/PLIST

JAVALIBNAME=	${PORTNAME}-${PORTVERSION}

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

do-build:
	@cd ${WRKSRC} && \
		${SETENV} JAVA_HOME=${JAVA_HOME} ant jar javadocs

pre-install:
	@${RM} -f ${PLIST}
	@${TOUCH} ${PLIST}
	@${ECHO} ${JAVAJARDIR}/${PORTNAME}.jar | \
		${SED} "s,${PREFIX}/*,," >> ${PLIST}
	@${ECHO} "@unexec ${RMDIR} ${JAVAJARDIR} 2>/dev/null || true" | \
		${SED} "s,${PREFIX}/*,," >> ${PLIST}

do-install: do-install-jar do-install-apidocs

do-install-jar:
	@${MKDIR} ${JAVAJARDIR}
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar ${JAVAJARDIR}/${PORTNAME}.jar

do-install-apidocs:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${CP} -r ${WRKSRC}/docs/api/* ${DOCSDIR}
	@${CHOWN} -h -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.mk>
