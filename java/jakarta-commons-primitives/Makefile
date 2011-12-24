# Ports collection makefile for:	Jakarta Commons Primitives
# Date created:				06 November 2003
# Whom:					Herve Quiroz <herve.quiroz@esil.univ-mrs.fr>
#
# $MidnightBSD: mports/java/jakarta-commons-primitives/Makefile,v 1.2 2008/05/01 23:26:56 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-commons-primitives/Makefile,v 1.4 2004/09/01 13:32:57 hq Exp $
#

PORTNAME=	commons-primitives
PORTVERSION=	1.0
PORTREVISION=	3
CATEGORIES=	java
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_SOURCE}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A library supporting Java primitive types
LICENSE=	apache2

USE_GCPIO=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.5+
USE_ANT=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
ALL_TARGET=	jar

PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar

.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
PORTDOCS=	LICENSE.txt api
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR file as ${JAVAJARDIR}/${PORTNAME}.jar..."
	@${INSTALL_DATA} ${WRKSRC}/target/${PORTNAME}-${PORTVERSION}.jar ${JAVAJARDIR}/${PORTNAME}.jar
	@${ECHO_MSG} " [DONE]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation..."
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/target/docs && ${FIND} api \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${INSTALL_DATA} ${WRKSRC}/LICENSE.txt ${DOCSDIR}/
	@${ECHO_MSG} " [DONE]"
.endif

.include <bsd.port.mk>
