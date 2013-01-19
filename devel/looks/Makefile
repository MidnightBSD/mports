# $MidnightBSD: mports/devel/looks/Makefile,v 1.2 2008/10/13 20:55:04 ctriv Exp $

PORTNAME=	looks
PORTVERSION=	2.0.4
CATEGORIES=	devel java
MASTER_SITES=	http://www.jgoodies.com/download/libraries/${PORTNAME}/
DISTNAME=	${PORTNAME}-${PORTVERSION:S|.|_|g}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The JGoodies Looks improve the appearance of your Java applications
LICENSE=	bsd3

USE_ZIP=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.6+
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

JARFILE=	${PORTNAME}.jar

###
# potential conflict with java/jcalendar, both install looksXXX.jar
###

PLIST_FILES=	%%JAVAJARDIR%%/${JARFILE}	\
		%%JAVAJARDIR%%/LICENSE.${PORTNAME}.txt
DOCFILES=	README.html RELEASE-NOTES.txt
EXAMPLES=	demo.jar lib/forms-1.0.7.jar tiny.jar
PORTDOCS=	*

.if !defined(NOPORTDOCS)
PLIST_FILES+=	${EXAMPLES:S|^|%%EXAMPLESDIR%%/|}
PLIST_DIRS+=	%%EXAMPLESDIR%%/lib %%EXAMPLESDIR%%
.endif

post-extract:
	@${MV} ${WRKSRC}/LICENSE.txt ${WRKSRC}/LICENSE.${PORTNAME}.txt

do-install:
	${INSTALL_DATA} ${JARFILE:S|.jar|-${PORTVERSION}.jar|:S|^|${WRKSRC}/|}	\
		${JAVAJARDIR}/${JARFILE}
	@${INSTALL_DATA} ${WRKSRC}/LICENSE.${PORTNAME}.txt ${JAVAJARDIR}
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR} ${EXAMPLESDIR}/lib
	@${INSTALL_DATA} ${DOCFILES:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${CP} -R ${WRKSRC}/docs/* ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
	@${INSTALL_DATA} ${EXAMPLES:S|^|${WRKSRC}/demo/|:S|lib|../lib|} ${EXAMPLESDIR}
	@${MV} ${EXAMPLESDIR}/forms-1.0.7.jar ${EXAMPLESDIR}/lib
	@${ECHO_MSG} "===> Examples installed in ${EXAMPLESDIR}."
.endif

.include <bsd.port.mk>
