PORTNAME=	protobuf-java
DISTVERSION=	3.8.0
CATEGORIES=	devel java
MASTER_SITES=	http://central.maven.org/maven2/com/google/protobuf/protobuf-java/${DISTVERSION}/
EXTRACT_SUFX=	.jar

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core Protocol Buffers library

LICENSE=	bsd3

USE_JAVA=	yes

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
