PORTNAME=	commons-dbcp
PORTVERSION=	2.12.0
CATEGORIES=	java databases
MASTER_SITES=	https://archive.apache.org/dist/commons/dbcp/binaries/
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}2-${PORTVERSION}-bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache Commons Database Connection Pool
WWW=		https://commons.apache.org/dbcp/

LICENSE=	Apache-2.0

RUN_DEPENDS=	${JAVALIBDIR}/commons-pool.jar:java/apache-commons-pool

OPTIONS_DEFINE=	DOCS

USES=		java
JAVA_VERSION=	8
NO_BUILD=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}2-${PORTVERSION}
JARFILE=	${PORTNAME}2-${PORTVERSION}.jar
DOCFILES=	LICENSE.txt \
		NOTICE.txt \
		RELEASE-NOTES.txt

PORTDOCS=	*
PLIST_FILES=	${JAVAJARDIR}/${PORTNAME}.jar \
		${JAVAJARDIR}/${JARFILE}

.include <bsd.mport.options.mk>

do-install:
	${INSTALL_DATA} ${WRKSRC}/${JARFILE} ${STAGEDIR}${JAVAJARDIR}
	${LN} -sf ${JARFILE} ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
.if ${PORT_OPTIONS:MDOCS}
	cd ${WRKSRC} && ${COPYTREE_SHARE} apidocs ${STAGEDIR}${DOCSDIR}
.for FILE in ${DOCFILES}
	${INSTALL_MAN} ${WRKSRC}/${FILE} ${STAGEDIR}${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
