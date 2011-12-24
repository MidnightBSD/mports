# New ports collection makefile for:	Jakarta Commons CLI
# Date created:				November 14, 2002
# Whom:					Ernst de Haan <znerd@FreeBSD.org>
#
# $MidnightBSD: mports/java/jakarta-commons-cli/Makefile,v 1.1 2008/09/10 23:53:57 laffer1 Exp $
# $FreeBSD: ports/java/jakarta-commons-cli/Makefile,v 1.13 2008/02/27 15:10:52 ehaupt Exp $
#

PORTNAME=	commons-cli
PORTVERSION=	1.2
PORTEPOCH=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_BINARIES}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java library for command line arguments and options
LICENSE=	apache2

USE_JAVA=	yes
JAVA_VERSION=	1.5+
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

JARFILE=	${PORTNAME}-${PORTVERSION}.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES=	%%JAVAJARDIR%%/${DESTJARFILE}
.if !defined(NOPORTDOCS)
PORTDOCS=	*
DOC_FILES=	LICENSE.txt NOTICE.txt RELEASE-NOTES.txt
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR as ${JAVAJARDIR}/${DESTJARFILE}..."
	@${INSTALL_DATA} ${WRKSRC}/${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@-${MKDIR} ${DOCSDIR}
	@cd ${WRKSRC} && ${COPYTREE_SHARE} apidocs ${DOCSDIR}
.for f in ${DOC_FILES}
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}/
.endfor
	@${ECHO_MSG} " [ DONE ]"
.endif

.include <bsd.port.mk>
