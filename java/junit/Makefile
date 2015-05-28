# $MidnightBSD$

PORTNAME=	junit
PORTVERSION=	4.12
CATEGORIES=	java devel
MASTER_SITES=	http://repo1.maven.org/maven2/${PORTNAME}/${PORTNAME}/${PORTVERSION}/
DISTFILES=	${DISTNAME}.jar ${DISTNAME}-sources.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Regression testing utility for use with the Java(TM) Language

LICENSE=	other

RUN_DEPENDS=	${JAVAJARDIR}/hamcrest.jar:${PORTSDIR}/java/hamcrest

USE_JAVA=	yes
NO_BUILD=	yes

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
PLIST_FILES=	%%JAVAJARDIR%%/junit.jar \
		%%JAVAJARDIR%%/junit4.jar \
		%%DATADIR%%/src.jar

do-install:
	${INSTALL_DATA} ${DISTDIR}/junit-${PORTVERSION}.jar \
		 ${JAVAJARDIR}/junit.jar
	${LN} -sf junit.jar ${JAVAJARDIR}/junit4.jar
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${DISTDIR}/junit-${PORTVERSION}-sources.jar \
		${DATADIR}/src.jar

.include <bsd.port.mk>
