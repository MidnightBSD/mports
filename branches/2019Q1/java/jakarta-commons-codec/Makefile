# $MidnightBSD$
# $FreeBSD: head/java/jakarta-commons-codec/Makefile 386097 2015-05-11 18:34:57Z mat $

PORTNAME=	commons-codec
PORTVERSION=	1.10
CATEGORIES=	java converters
MASTER_SITES=	APACHE_COMMONS_SOURCE
PKGNAMEPREFIX=	jakarta-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementations of common encoders and decoders

LICENSE=	apache2

OPTIONS_DEFINE=	DOCS

USE_JAVA=	yes
JAVA_VERSION=	1.6+
USE_ANT=	yes

ALL_TARGET=	dist

PLIST_FILES=	%%JAVAJARDIR%%/${PORTNAME}.jar

PORTDOCS=	*

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} 's/1.9-SNAPSHOT/1.10/' ${WRKSRC}/default.properties

do-install:
	@${ECHO_MSG} -n ">> Installing JAR file as ${JAVAJARDIR}/${PORTNAME}.jar..."
	@${INSTALL_DATA} ${WRKSRC}/dist/${PORTNAME}-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	@${ECHO_MSG} " [DONE]"
.if ${PORT_OPTIONS:MDOCS}
	@${ECHO_MSG} -n ">> Installing documentation..."
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	@cd ${WRKSRC}/dist/docs && ${FIND} api \
	  | ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${DOCSDIR} > /dev/null 2>&1
	@${INSTALL_DATA} ${WRKSRC}/dist/RELEASE-NOTES.txt \
		${STAGEDIR}${DOCSDIR}/
	@${ECHO_MSG} " [DONE]"
.endif

.include <bsd.port.mk>
