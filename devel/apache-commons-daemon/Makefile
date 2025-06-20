PORTNAME=	commons-daemon
PORTVERSION=	1.4.0
CATEGORIES=	devel java
MASTER_SITES=	https://archive.apache.org/dist/commons/daemon/source/:src \
		https://archive.apache.org/dist/commons/daemon/binaries/:bin

PKGNAMEPREFIX=	apache-
DISTFILES=	${PORTNAME}-${PORTVERSION}-native-src${EXTRACT_SUFX}:src \
		${PORTNAME}-${PORTVERSION}-bin${EXTRACT_SUFX}:bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper code to start/stop a Java application as a daemon
WWW=		https://commons.apache.org/proper/commons-daemon/

LICENSE=	Apache-2.0

OPTIONS_DEFINE=	DOCS

USES=		java
JAVA_OS=	freebsd
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-java=${JAVA_HOME}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

WRKSRC=		${WRKDIR}/${DISTNAME}-native-src/unix
WRKBIN=		${WRKDIR}/${DISTNAME}

PLIST_FILES=	bin/jsvc %%JAVAJARDIR%%/${PORTNAME}.jar

PORTDOCS=	*

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/jsvc ${STAGEDIR}${PREFIX}/bin
	${INSTALL_DATA} ${WRKBIN}/${DISTNAME}.jar \
		${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKBIN} && ${COPYTREE_SHARE} apidocs ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
