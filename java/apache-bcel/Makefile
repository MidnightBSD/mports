PORTNAME=	bcel
PORTVERSION=	6.6.1
CATEGORIES=	java devel
MASTER_SITES=	https://archive.apache.org/dist/commons/${PORTNAME}/binaries/
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache Commons Byte Code Engineering Library
WWW=		https://commons.apache.org/proper/commons-bcel/

LICENSE=	Apache-2.0

USES=		java
NO_BUILD=	yes

NO_ARCH=	yes

WRKSRC= 	${WRKDIR}/${PORTNAME}-${PORTVERSION}
PLIST_FILES=	%%JAVAJARDIR%%/bcel.jar

OPTIONS_DEFINE=	DOCS

PORTDOCS=	*

do-install:
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}-${PORTVERSION}.jar \
	    ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	(cd ${WRKSRC}/apidocs && ${COPYTREE_SHARE} . ${STAGEDIR}${DOCSDIR} "-not -empty")

.include <bsd.port.mk>
