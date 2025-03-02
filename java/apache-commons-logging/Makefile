PORTNAME=	commons-logging
PORTVERSION=	1.3.5
CATEGORIES=	java devel
MASTER_SITES=	APACHE_COMMONS_BINARIES
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generic logging wrapper library
WWW=		https://commons.apache.org/proper/commons-logging/

LICENSE=	apache2

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

USES=		java
NO_BUILD=	yes

JARFILE=	${PORTNAME}-${PORTVERSION}.jar

PORTDOCS=	*
PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar \
		%%JAVAJARDIR%%/${JARFILE}

do-install:
	${INSTALL_DATA} ${WRKSRC}/${JARFILE} ${STAGEDIR}${JAVAJARDIR}
	${LN} -sf ${JARFILE} ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	(cd ${WRKSRC}/apidocs && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR})

.include <bsd.port.mk>
