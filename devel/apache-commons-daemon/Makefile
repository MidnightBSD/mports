PORTNAME=	commons-daemon
PORTVERSION=	1.3.3
CATEGORIES=	devel java
MASTER_SITES=	https://archive.apache.org/dist/commons/daemon/source/:src \
		https://archive.apache.org/dist/commons/daemon/binaries/:bin

PKGNAMEPREFIX=	apache-
DISTFILES=	${PORTNAME}-${PORTVERSION}-native-src${EXTRACT_SUFX}:src \
		${PORTNAME}-${PORTVERSION}-bin${EXTRACT_SUFX}:bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper code to start/stop a Java application as a daemon
WWW=		https://commons.apache.org/proper/commons-daemon/

LICENSE=	apache2

OPTIONS_DEFINE=	DOCS

USE_JAVA=	yes
JAVA_VERSION=	1.8+
JAVA_OS=	freebsd
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-java=${JAVA_HOME}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

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
