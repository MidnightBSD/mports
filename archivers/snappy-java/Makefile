# $MidnightBSD$

PORTNAME=	snappy-java
PORTVERSION=	1.0.4.1
PORTREVISION=	2
CATEGORIES=	archivers java
MASTER_SITES=	http://pkgs.fedoraproject.org/repo/pkgs/snappy/snappy-1.0.4.tar.gz/b69151652e82168bc5c643bcd6f07162/:source2 \
		FREEBSD_LOCAL/jgh/archivers/${PORTNAME}/:source3 \
		https://github.com/xerial/snappy-java/archive/:source1
DISTFILES+=	snappy-${PORTVERSION:R}.tar.gz:source2 \
		FreeBSD-snappy-${PORTVERSION}-maven-repository.tar.gz:source3 \
		snappy-java-1.0.4.1.tar.gz:source1
EXTRACT_ONLY=	snappy-java-1.0.4.1.tar.gz \
		FreeBSD-snappy-${PORTVERSION}-maven-repository.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast compressor/decompressor library

LICENSE=	apache2

WRKSRC=		${WRKDIR}/snappy-java-snappy-java-1.0.4.1

BUILD_DEPENDS=	${LOCALBASE}/share/java/maven3/bin/mvn:java/maven3

BROKEN_armv6=		fails to build: maven-assembly-plugin: Failed to retrieve numeric file attributes

#USE_GITHUB=	yes
#GH_ACCOUNT=	xerial
#GH_PROJECT=	snappy-java

USE_JAVA=	yes
JAVA_VERSION=	1.7+
USES=		gmake
USE_LDCONFIG=	yes
MAKE_ARGS+=	Default_CXX=${CXX}

PLIST_FILES=	%%JAVAJARDIR%%/snappy-java.jar lib/libsnappyjava.so

post-patch:
	@${REINPLACE_CMD} -e 's|curl.*||g ; \
		s|MVN:=mvn|MVN:=${LOCALBASE}/share/java/maven3/bin/mvn -Dmaven.repo.local=${WRKDIR}/repository --offline|g' \
		${WRKSRC}/Makefile

do-build:
	@${MKDIR} ${WRKSRC}/target
	@${CP} ${DISTDIR}/snappy-${PORTVERSION:R}.tar.gz ${WRKSRC}/target/
	cd ${WRKSRC} && ${SETENV} JAVA_HOME=${JAVA_HOME} \
	${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS} && ${LOCALBASE}/share/java/maven3/bin/mvn -Dmaven.repo.local=${WRKDIR}/repository --offline test

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/snappy-java-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/snappy-java.jar
	${INSTALL_LIB} ${WRKSRC}/target/snappy-${PORTVERSION:R}-Default/libsnappyjava.so \
		${FAKE_DESTDIR}${LOCALBASE}/lib

.include <bsd.port.mk>
