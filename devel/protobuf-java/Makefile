PORTNAME=	protobuf-java
DISTVERSION=	3.25.3
CATEGORIES=	devel java
MASTER_SITES=	https://repo1.maven.org/maven2/com/google/protobuf/protobuf-java/${DISTVERSION}/
EXTRACT_SUFX=	.jar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core Protocol Buffers library
WWW=		https://mvnrepository.com/artifact/com.google.protobuf/protobuf-java

LICENSE=	bsd3

USES=		java

NO_WRKSUBDIR=	yes
EXTRACT_CMD=	${CP}
EXTRACT_BEFORE_ARGS=
EXTRACT_AFTER_ARGS=	.

NO_ARCH=	yes
NO_BUILD=	yes

PLIST_FILES=	${JAVAJARDIR}/${PORTNAME}.jar

do-install:
	${INSTALL_DATA} ${WRKSRC}/${DISTNAME}.jar ${STAGEDIR}${JAVAJARDIR}/${PORTNAME}.jar

.include <bsd.port.mk>
