# $MidnightBSD$
# $FreeBSD: ports/java/jaf/Makefile,v 1.19 2012/01/17 01:42:10 jgh Exp $
#

PORTNAME=	jaf
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	http://central.maven.org/maven2/javax/activation/activation/1.1.1/
DISTFILES=	activation-1.1.1.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JavaBeansTM Activation Framework

LICENSE=	cddl

USE_JAVA=	YES
JAVA_VERSION=	1.6+

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
NO_BUILD=	yes
NO_CDROM=	See the license

PLIST_FILES=	%%JAVAJARDIR%%/activation.jar

.include <bsd.port.pre.mk>

post-extract:
	${MKDIR} ${WRKSRC}
	${CP} ${DISTDIR}/${DISTFILES} ${WRKSRC}	

do-install:
	@${ECHO_MSG} -n ">> Installing JAR file as ${JAVAJARDIR}/activation.jar..."
	@${INSTALL_DATA} ${WRKSRC}/${DISTFILES} ${JAVAJARDIR}/activation.jar
	@${ECHO_MSG} " [ DONE ]"

.include <bsd.port.post.mk>
