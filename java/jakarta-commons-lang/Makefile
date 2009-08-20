# $MidnightBSD: mports/java/jakarta-commons-lang/Makefile,v 1.2 2009/03/02 21:56:55 laffer1 Exp $

PORTNAME=	commons-lang
PORTVERSION=	2.3
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	${MASTER_SITE_APACHE_COMMONS_SOURCE}
MASTER_SITE_SUBDIR=	${PORTNAME:S,commons-,,}
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Jakarta library with helper utilities for the java.lang API
LICENSE=	apache2

USE_JAVA=	yes
JAVA_VERSION=	1.2+

USE_ANT=	yes
USE_JIKES=	no

ALL_TARGET=	jar
.if !defined(PACKAGE_BUILDING)
.if !defined(NOPORTDOCS)
ALL_TARGET+=	javadoc
PORTDOCS=	*
.endif
.endif

JARFILE=	${PORTNAME}-${PORTVERSION}.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES=	%%JAVAJARDIR%%/${DESTJARFILE}

.include <bsd.port.pre.mk>

JDK_API!=	(${FIND} -s ${LOCALBASE}/share/doc/jdk1.? -maxdepth 1 -name api -type d 2>/dev/null || ${TRUE}) | ${TAIL} -n 1

.if ${JDK_API} != ""
MAKE_ARGS+=	-Djdk.javadoc=${JDK_API}
.endif

do-install:
	@${INSTALL_DATA} ${WRKSRC}/dist/${JARFILE} ${JAVAJARDIR}/${DESTJARFILE}

.if !defined(NOPORTDOCS)
	-cd ${WRKSRC}/dist/docs/api \
	  && ${FIND} . -type d -exec ${MKDIR} ${DOCSDIR}/{} \; \
	  && ${FIND} . -type f -exec ${INSTALL_DATA} {} ${DOCSDIR}/{} \;
.endif

.include <bsd.port.post.mk>
