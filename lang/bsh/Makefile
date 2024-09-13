PORTNAME=	bsh
DISTVERSION=	2.1.1
CATEGORIES=	lang java

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Beanshell Java scripting language

LICENSE=	apache2

USE_GITHUB=	yes
GH_ACCOUNT=	beanshell
GH_PROJECT=	beanshell

USE_JAVA=	8
USE_ANT=	yes

CONFLICTS_INSTALL=	schilyutils # bin/bsh

ALL_TARGET=	jarall

SUB_FILES=	${PORTNAME}.sh
SUB_LIST=	JARNAME=${PORTNAME}.jar

PLIST_FILES=	${JAVAJARDIR}/${PORTNAME}.jar \
		bin/${PORTNAME}

do-install:
	${INSTALL_DATA} ${WRKSRC}/dist/${PORTNAME}-${DISTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	${INSTALL_SCRIPT} ${WRKDIR}/${PORTNAME}.sh \
		${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
