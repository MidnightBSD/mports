# New ports collection makefile for:	JDOM
# Date created:		June 1, 2001
# Whom:			Ernst de Haan <znerd@FreeBSD.org>
#
# $MidnightBSD: mports/java/jdom/Makefile,v 1.2 2008/05/09 17:34:46 laffer1 Exp $
# $FreeBSD: ports/java/jdom/Makefile,v 1.15 2004/12/03 01:01:24 hq Exp $
#

PORTNAME=	jdom
PORTVERSION=	1.1
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	java textproc
MASTER_SITES=	http://www.jdom.org/dist/source/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java library for accessing and manipulating XML documents
LICENSE=	other
# very simliar to bsd license.

RUN_DEPENDS=	${JAVALIBDIR}/jaxen-jdom.jar:${PORTSDIR}/java/jaxen

USE_GCPIO=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.2+
USE_ANT=	yes

ALL_TARGET=	package
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
OTHERDOCS=	README.txt TODO.txt CHANGES.txt COMMITTERS.txt LICENSE.txt
PORTDOCS=	apidocs ${OTHERDOCS}
.endif

MAKE_ENV+=	CLASSPATH=${JAVALIBDIR}/jaxen-jdom.jar

PLIST_FILES=	%%JAVAJARDIR%%/jdom.jar

do-install:
	@${MKDIR} ${JAVAJARDIR}
	@${INSTALL_DATA} ${WRKSRC}/build/jdom.jar ${JAVAJARDIR}/
.if !defined(NOPORTDOCS)
	@${MKDIR} ${EXAMPLESDIR}
	@cd ${WRKSRC}/build/samples/ && ${FIND} . \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${EXAMPLESDIR} > /dev/null 2>&1
	@${MKDIR} ${DOCSDIR}/apidocs
	@cd ${WRKSRC}/build/ && ${FIND} apidocs \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${DOCSDIR} > /dev/null 2>&1
	@${INSTALL_DATA} ${OTHERDOCS:S,^,${WRKSRC}/,} ${DOCSDIR}/
.endif

.if !defined(NOPORTDOCS)
post-install:
	@${FIND} -s ${WRKSRC}/build/samples -not -type d | \
		${SED} -ne 's,^${WRKSRC}/build/samples,${EXAMPLESDIR:S,${PREFIX}/,,},p' >> ${TMPPLIST}
	@${FIND} -s -d ${WRKSRC}/build/samples -type d | \
		${SED} -ne 's,^${WRKSRC}/build/samples,@dirrm ${EXAMPLESDIR:S,${PREFIX}/,,},p' >> ${TMPPLIST}
.endif

.include <bsd.port.mk>
