# $MidnightBSD$

PORTNAME=	hamcrest
PORTVERSION=	1.3
CATEGORIES=	java devel
MASTER_SITES=	http://repo1.maven.org/maven2/org/${PORTNAME}/${PORTNAME}-all/${PORTVERSION}/
DISTFILES=	${PORTNAME}-all-${PORTVERSION}.jar ${PORTNAME}-all-${PORTVERSION}-sources.jar
EXTRACT_ONLY=

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library of matchers for building test expressions

LICENSE=	unknown

USE_JAVA=	yes
NO_BUILD=	yes

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
PLIST_FILES=	%%JAVAJARDIR%%/hamcrest.jar \
		%%JAVAJARDIR%%/hamcrest1.3.jar \
		%%DATADIR%%/src.jar

do-install:
	${INSTALL_DATA} ${DISTDIR}/${PORTNAME}-all-${PORTVERSION}.jar \
		 ${JAVAJARDIR}/${PORTNAME}.jar
	${LN} -sf ${PORTNAME}.jar ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}1.3.jar
	@${MKDIR} ${DATADIR}
	${INSTALL_DATA} ${DISTDIR}/${PORTNAME}-all-${PORTVERSION}-sources.jar \
		${DATADIR}/src.jar

.include <bsd.port.mk>
