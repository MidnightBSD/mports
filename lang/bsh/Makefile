# Created by: Kimura Fuyuki <fuyuki@mj.0038.net>

PORTNAME=	bsh
DISTVERSION=	2.1.0
CATEGORIES=	lang java

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beanshell Java scripting language

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	beanshell
GH_PROJECT=	beanshell

USE_JAVA=	yes
JAVA_BUILD=	8

USE_ANT=	yes
ALL_TARGET=	jarall

CONFLICTS_INSTALL=	schilyutils # bin/bsh

SUB_FILES=	${PORTNAME}.sh
SUB_LIST=	JARNAME=${PORTNAME}.jar

PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar \
		bin/${PORTNAME}

do-install:
	${INSTALL_DATA} ${WRKSRC}/dist/${PORTNAME}-${DISTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
