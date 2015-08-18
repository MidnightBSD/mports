# $MidnightBSD$

PORTNAME=	looks
DISTVERSION=	2_6_0
CATEGORIES=	devel java
MASTER_SITES=	http://www.jgoodies.com/download/libraries/${PORTNAME}/
DISTNAME=	jgoodies-${PORTNAME}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The JGoodies Looks improve the appearance of your Java applications

LICENSE=	bsd3

USES=		zip
USE_JAVA=	yes
JAVA_VERSION=	1.6+
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/jgoodies-${PORTNAME}-${PORTVERSION}

JARFILE=	jgoodies-${PORTNAME}-${PORTVERSION}.jar

PLIST_FILES=	%%JAVAJARDIR%%/${JARFILE} \
		%%JAVAJARDIR%%/looks.jar
DOCFILES=	README.html RELEASE-NOTES.txt
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_DATA} ${WRKSRC}/${JARFILE} ${STAGEDIR}${JAVAJARDIR}
	${LN} -sf ${JARFILE} ${STAGEDIR}${JAVAJARDIR}/looks.jar
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${DOCFILES:S|^|${WRKSRC}/|} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/docs/ && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
