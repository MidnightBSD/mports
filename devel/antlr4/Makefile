PORTNAME=	antlr4
PORTVERSION=	4.12.0
CATEGORIES=	devel java
MASTER_SITES=	http://www.antlr.org/download/
DISTNAME=	antlr-${PORTVERSION}-complete
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ANother Tool for Language Recognition
WWW=		https://www.antlr.org/

LICENSE=	bsd3

NO_BUILD=	yes
NO_ARCH=	yes
USE_JAVA=	yes
JAVA_VERSION=	8+
INSTALL_JAR=	${DISTFILES}
SUB_LIST=	INSTALL_JAR=${INSTALL_JAR}
SUB_FILES=	antlr.sh
PLIST_FILES=	bin/${PORTNAME} \
		${JAVAJARDIR}/${INSTALL_JAR}

do-install:
	@${MKDIR} ${STAGEDIR}${JAVAJARDIR}
	${INSTALL_DATA} ${DISTDIR}/${DISTFILES} ${STAGEDIR}${JAVAJARDIR}/${INSTALL_JAR}
	${INSTALL_SCRIPT} ${WRKDIR}/antlr.sh ${STAGEDIR}${PREFIX}/bin/${PORTNAME}

.include <bsd.port.mk>
