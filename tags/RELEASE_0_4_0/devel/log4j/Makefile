# $MidnightBSD: mports/devel/log4j/Makefile,v 1.3 2009/09/17 00:06:20 laffer1 Exp $

PORTNAME=	log4j
PORTVERSION=	1.2.16
CATEGORIES=	devel java
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	logging/${PORTNAME}/${PORTVERSION}
DISTNAME=	apache-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A fast and flexible logging library for Java
LICENSE=	apache2

USE_JAVA=	YES
NO_BUILD=	YES

PLIST_FILES=	%%JAVAJARDIR%%/log4j.jar

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/${PORTNAME}.jar..."
	@${INSTALL_DATA} ${WRKSRC}/log4j-${PORTVERSION}.jar ${JAVAJARDIR}/${PORTNAME}.jar
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}/..."
	@cd ${WRKSRC}/site \
	  && ${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
	@${ECHO_MSG} " [ DONE ]"
	@${ECHO_MSG} -n ">> Installing examples in ${EXAMPLESDIR}/..."
	@cd ${WRKSRC}/examples \
	  && ${FIND} . -type d -exec ${MKDIR} ${EXAMPLESDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${EXAMPLESDIR}/{} \;
	@${ECHO_MSG} " [ DONE ]"
.endif

.if !defined(NOPORTDOCS)
post-install:
	@${FIND} -s ${WRKSRC}/examples -not -type d \
	  | ${SED} -ne 's,^${WRKSRC}/examples,${EXAMPLESDIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${WRKSRC}/examples -type d \
	  | ${SED} -ne 's,^${WRKSRC}/examples,@dirrm ${EXAMPLESDIR:S,^${PREFIX}/,,},p' >> ${TMPPLIST}
.endif

.include <bsd.port.mk>
