# New ports collection makefile for:	Jakarta Commons CLI
# Date created:				November 14, 2002
# Whom:					Ernst de Haan <znerd@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/java/jakarta-commons-cli/Makefile,v 1.13 2008/02/27 15:10:52 ehaupt Exp $
#

PORTNAME=	commons-cli
PORTVERSION=	1.0
PORTEPOCH=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_SOURCE}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	cli-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Java library for command line arguments and options
LICENSE=	apache2

BUILD_DEPENDS=	${JAVALIBDIR}/commons-lang.jar:${PORTSDIR}/java/jakarta-commons-lang

USE_JAVA=	yes
JAVA_VERSION=	1.2+

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

USE_ANT=	yes
MAKE_ENV+=	ANT_INCLUDE_SHARED_JARS=YES
MAKE_ARGS=	-Dnoget=yes
ALL_TARGET=	jar
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
.endif

JARFILE=	${PORTNAME}-${PORTVERSION}-beta-2-dev.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES=	%%JAVAJARDIR%%/${DESTJARFILE}
.if !defined(NOPORTDOCS)
PORTDOCS=	apidocs LICENSE.txt
.endif

post-extract:
	@${MKDIR} ${WRKSRC}/lib

do-install:
	@${INSTALL_DATA} ${WRKSRC}/target/${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}
.if !defined(NOPORTDOCS)
	@cd ${WRKSRC}/target/docs \
	  && ${FIND} apidocs -type d -exec ${MKDIR} ${DOCSDIR}/{} \; \
	  && ${FIND} apidocs -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
	@${INSTALL_DATA} ${WRKSRC}/LICENSE.txt ${DOCSDIR}/
.endif

.include <bsd.port.mk>
