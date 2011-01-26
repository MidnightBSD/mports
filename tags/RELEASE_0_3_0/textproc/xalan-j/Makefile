# New ports collection makefile for:	xalan-j
# Date created:		21 February 2001
# Whom:			znerd@FreeBSD.org
#
# $MidnightBSD: mports/textproc/xalan-j/Makefile,v 1.1 2008/10/04 16:39:10 laffer1 Exp $
# $FreeBSD: ports/textproc/xalan-j/Makefile,v 1.23 2008/06/06 14:05:06 edwin Exp $
#

PORTNAME=	xalan-j
PORTVERSION=	2.7.0
CATEGORIES=	textproc java
MASTER_SITES=	${MASTER_SITE_APACHE_XML}
MASTER_SITE_SUBDIR=	${PORTNAME}/source
DISTNAME=	${PORTNAME}_${PORTVERSION:S/./_/g}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache XSLT processor for transforming XML documents
LICENSE=	apache2

RUN_DEPENDS=	java:${PORTSDIR}/java/javavmwrapper

USE_JAVA=	yes
JAVA_VERSION=	1.5+
USE_ANT=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}_${PORTVERSION:S/./_/g}
ALL_TARGET=	jar
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadocs
PORTDOCS=	apidocs design
.endif
JARFILES=	xalan.jar serializer.jar
PLIST_FILES=	${JARFILES:S|^|%%JAVAJARDIR%%/|} bin/xalan-j

SUB_FILES=	xalan-j.sh

.include <bsd.port.pre.mk>

.if ${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1.\2/} != "1.5"
RUN_DEPENDS+=	${JAVALIBDIR}/xml-apis.jar:${PORTSDIR}/textproc/xerces-j
.endif

do-install:
	@${ECHO_MSG} -n ">> Installing JAR files in ${JAVAJARDIR}..."
.for jarfile in ${JARFILES}
	@${INSTALL_DATA} ${WRKSRC}/build/${jarfile} ${JAVAJARDIR}/
	@${ECHO_MSG} -n " ${jarfile}"
.endfor
	@${ECHO_MSG} " [ DONE ]"
.if !defined(NOPORTDOCS)
	@${ECHO_MSG} -n ">> Installing documentation in ${DOCSDIR}..."
	@cd ${WRKSRC}/build/docs && ${FIND} ${PORTDOCS} -type d -exec ${MKDIR} ${DOCSDIR}/{} \;
	@cd ${WRKSRC}/build/docs && ${FIND} ${PORTDOCS} -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
	@${ECHO_MSG} " [ DONE ]"
.endif
	@${ECHO_MSG} -n ">> Installing script in ${PREFIX}/bin/..."
	@${INSTALL_SCRIPT} ${WRKDIR}/xalan-j.sh ${PREFIX}/bin/xalan-j
	@${ECHO_MSG} " [ DONE ]"

.include <bsd.port.post.mk>
