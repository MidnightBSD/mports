PORTNAME=	commons-lang
PORTVERSION=	2.6
PORTREVISION=	1
CATEGORIES=	java devel
MASTER_SITES=	APACHE_COMMONS_SOURCE
PKGNAMEPREFIX=	apache-
DISTNAME=	${PORTNAME}-${PORTVERSION}-src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Apache library with helper utilities for the java.lang API
WWW=		https://commons.apache.org/proper/commons-lang/

LICENSE=	Apache-2.0

USES=		java:ant,run
JAVA_VERSION=	8
ALL_TARGET=	jar
NO_ARCH=	yes

JARFILE=	${PORTNAME}-${PORTVERSION}.jar
DESTJARFILE=	${PORTNAME}.jar
PLIST_FILES=	%%JAVAJARDIR%%/${DESTJARFILE}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MDOCS}
ALL_TARGET+=	javadoc
.endif

JDK_API!=	(${FIND} -s ${LOCALBASE}/share/doc/jdk1.? -maxdepth 1 -name api -type d 2>/dev/null || ${ECHO_CMD}) | ${TAIL} -n 1

.if ${JDK_API} != ""
MAKE_ARGS+=	-Djdk.javadoc=${JDK_API}
.endif

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/${JARFILE} \
		${STAGEDIR}${JAVAJARDIR}/${DESTJARFILE}
.if ${PORT_OPTIONS:MDOCS}
	(cd ${WRKSRC}/target/apidocs && ${COPYTREE_SHARE} . \
		${STAGEDIR}${DOCSDIR})
.endif

.include <bsd.port.post.mk>
