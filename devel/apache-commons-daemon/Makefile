PORTNAME=	commons-daemon
DISTVERSION=	1.5.1
PORTREVISION=	2
CATEGORIES=	devel java
MASTER_SITES=	https://archive.apache.org/dist/commons/daemon/source/:src \
		https://archive.apache.org/dist/commons/daemon/binaries/:bin
PKGNAMEPREFIX=	apache-
DISTFILES=	${PORTNAME}-${DISTVERSION}-native-src${EXTRACT_SUFX}:src \
		${PORTNAME}-${DISTVERSION}-bin${EXTRACT_SUFX}:bin

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Wrapper code to start/stop a Java application as a daemon
WWW=		https://commons.apache.org/proper/commons-daemon/

LICENSE=	Apache-2.0

USES=		java
JAVA_OS=	freebsd
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-java=${JAVA_HOME}
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd12.4

WRKSRC=		${WRKDIR}/${DISTNAME}-native-src/unix
WRKBIN=		${WRKDIR}/${DISTNAME}

PLIST_FILES=	bin/jsvc ${JAVAJARDIR}/${PORTNAME}.jar

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/jsvc ${PREFIX}/bin
	${INSTALL_DATA} ${WRKBIN}/${DISTNAME}.jar \
		${JAVAJARDIR}/${PORTNAME}.jar

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKBIN}/${PORTNAME}-${DISTVERSION}-javadoc.jar \
			${FAKE_DESTDIR}${DOCSDIR}/${PORTNAME}-javadoc.jar

.include <bsd.port.mk>
