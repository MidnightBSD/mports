# Ports collection makefile for:	Avalon LogKit
# Date created:				06 November 2003
# Whom:					Herve Quiroz <herve.quiroz@esil.univ-mrs.fr>
#
# $MidnightBSD: mports/java/avalon-logkit/Makefile,v 1.3 2008/05/01 23:01:48 laffer1 Exp $
# $FreeBSD: ports/java/avalon-logkit/Makefile,v 1.4 2004/09/01 13:36:46 hq Exp $
#

PORTNAME=	logkit
PORTVERSION=	1.2
PORTREVISION=	3
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE}
MASTER_SITE_SUBDIR=	avalon/${PORTNAME:S,-,/,}/binaries
PKGNAMEPREFIX=	avalon-
DISTNAME=	LogKit-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java toolkit designed for secure performance oriented logging
LICENSE=	apache1.1

USE_GCPIO=	yes
USE_JAVA=	YES
JAVA_VERSION=	1.3+
NO_BUILD=	YES

WRKSRC=		${WRKDIR}/LogKit-${PORTVERSION}
PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar

.if !defined(NOPORTDOCS)
PORTDOCS=	api changes.html css features.html images index.html whitepaper.html
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR file as ${JAVAJARDIR}/${PORTNAME}.jar..."
	@${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar ${JAVAJARDIR}/${PORTNAME}.jar
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC}/docs && ${FIND} ${PORTDOCS} \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
.endif

.include <bsd.port.mk>
