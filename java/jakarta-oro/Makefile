# Ports collection makefile for:    Jakarta ORO
# Date created:         2000/12/01
# Whom:                 Dave Glowacki <dglo@ssec.wisc.edu>
#
# $MidnightBSD: mports/java/jakarta-oro/Makefile,v 1.2 2008/05/01 23:20:28 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-oro/Makefile,v 1.11 2005/10/10 04:43:52 linimon Exp $
#

PORTNAME=	jakarta-oro
PORTVERSION=	2.0.8
CATEGORIES=	java
MASTER_SITES=	http://archive.apache.org/dist/jakarta/oro/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl/awk/sh regular expressions for Java
LICENSE=	apache1.1

BUILD_DEPENDS=	${LOCALBASE}/bin/ant:${PORTSDIR}/devel/apache-ant

USE_JAVA=	yes
JAVA_VERSION=	1.2+

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
