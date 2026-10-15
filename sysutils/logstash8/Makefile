PORTNAME=	logstash
PORTVERSION=	8.19.23
DISTVERSIONSUFFIX=	-darwin-x86_64
CATEGORIES=	sysutils java
MASTER_SITES=	https://artifacts.elastic.co/downloads/logstash/
MASTER_SITES+=	https://repo.maven.apache.org/maven2/com/github/jnr/jnr-posix/${JNR_POSIX_VERSION}/:posix \
		https://repo.maven.apache.org/maven2/com/github/jnr/jnr-constants/${JNR_CONSTANTS_VERSION}/:constants
PKGNAMESUFFIX=	8
DISTNAME=	${PORTNAME}-oss-${PORTVERSION}${DISTVERSIONSUFFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		jnr-posix-${JNR_POSIX_VERSION}-sources.jar:posix \
		jnr-constants-${JNR_CONSTANTS_VERSION}-sources.jar:constants
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Server-side data ingestion and transformation tool (8.x OSS version)
WWW=		https://www.elastic.co/products/logstash

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	bundled FreeBSD libfixposix is only available for amd64

RUN_DEPENDS=	${LOCALBASE}/bin/bash:shells/bash

USES=		cpe java shebangfix
CPE_VENDOR=	elastic
JAVA_VERSION=	21
USE_GITHUB=	nodefault
GH_TUPLE=	jnr:jffi:jffi-${JFFI_VERSION}:jffi \
		jruby:jruby:${JRUBY_VERSION}:jruby
USE_RC_SUBR=	logstash

SHEBANG_FILES=	bin/*

CONFLICTS=	logstash6 logstash7

JFFI_VERSION=		1.3.15
JNR_CONSTANTS_VERSION=	0.10.4
JNR_POSIX_VERSION=	3.1.22
JRUBY_VERSION=		9.4.15.0

EXTRACT_AFTER_ARGS+=	--exclude jdk.app --exclude '*.bat' \
			--exclude '*/libfixposix/binary/*-darwin' \
			--exclude '*/libfixposix/binary/*-linux' \
			--exclude '*/libfixposix/binary/x86-freebsd'

PORTSCOUT=	limit:^8

SUB_FILES=	pkg-message
SUB_LIST=	JAVA_HOME=${JAVA_HOME} \
		LOGSTASH_HOME=${LOGSTASH_HOME}

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

USERS=		logstash
GROUPS=		logstash

LOGSTASH_CONF_FILES=		jvm.options log4j2.properties logstash.yml \
				pipelines.yml startup.options
LOGSTASH_HOME?=			${PREFIX}/${PORTNAME}
LOGSTASH_JRUBY_BIN_FILES=	ast gem irb jgem jirb jirb_swing jruby \
				jruby.sh jrubyc rake rdoc ri
LOGSTASH_JRUBY_SUBDIR=		vendor/jruby/bin

post-extract:
	${MKDIR} ${WRKSRC}/bsd-src
	${TAR} -xf ${DISTDIR}/jnr-jffi-jffi-${JFFI_VERSION}_GH0.tar.gz \
		-C ${WRKSRC}/bsd-src --strip-components=4 \
		jffi-jffi-${JFFI_VERSION}/src/main/java/com/kenai/jffi/Platform.java \
		jffi-jffi-${JFFI_VERSION}/src/main/java/com/kenai/jffi/internal/StubLoader.java
	${TAR} -xf ${DISTDIR}/jruby-jruby-${JRUBY_VERSION}_GH0.tar.gz \
		-C ${WRKSRC}/bsd-src --strip-components=5 \
		jruby-${JRUBY_VERSION}/core/src/main/java/org/jruby/platform/Platform.java \
		jruby-${JRUBY_VERSION}/core/src/main/java/org/jruby/ext/ffi/Platform.java
	${TAR} -xf ${DISTDIR}/jnr-posix-${JNR_POSIX_VERSION}-sources.jar \
		-C ${WRKSRC}/bsd-src jnr/posix/POSIXFactory.java \
		jnr/posix/util/Platform.java jnr/posix/FreeBSDPOSIX.java \
		jnr/posix/FreeBSDFileStat12.java
	${TAR} -xf ${DISTDIR}/jnr-constants-${JNR_CONSTANTS_VERSION}-sources.jar \
		-C ${WRKSRC}/bsd-src jnr/constants/PlatformConstants.java

post-patch:
	${REINPLACE_CMD} 's|%%ETCDIR%%|${ETCDIR}|g' ${WRKSRC}/config/logstash.yml
	${FIND} ${WRKSRC} -name '*.orig' -delete

do-build:
	${SETENV} JAVA_HOME=${JAVA_HOME} ${SH} ${FILESDIR}/build-bsd.sh \
		${WRKSRC} ${WRKDIR}/bsd-classes

do-test:
	${CC} ${CFLAGS} ${FILESDIR}/stat-layout.c -o ${WRKDIR}/stat-layout
	${JAVA} -XX:TieredStopAtLevel=1 \
		--add-opens java.base/sun.nio.ch=ALL-UNNAMED \
		--add-opens java.base/java.io=ALL-UNNAMED \
		-Djruby.home=${WRKSRC}/vendor/jruby \
		-classpath ${WRKSRC}/vendor/jruby/lib/jruby.jar \
		org.jruby.Main ${FILESDIR}/bsd-native-tests.rb ${WRKDIR}/stat-layout

do-install:
	${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/logstash.conf.sample ${ETCDIR}
.for x in ${LOGSTASH_CONF_FILES}
	${INSTALL_DATA} ${WRKSRC}/config/${x} ${ETCDIR}/${x}.sample
.endfor
	${RM} -rf ${WRKSRC}/config
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${LOGSTASH_HOME} "-not -regex ./bsd-src.*")
	${CHMOD} ${BINMODE} ${LOGSTASH_HOME}/bin/*
.for x in ${LOGSTASH_JRUBY_BIN_FILES}
	${CHMOD} ${BINMODE} ${LOGSTASH_HOME}/${LOGSTASH_JRUBY_SUBDIR}/${x}
.endfor
	${FIND} ${LOGSTASH_HOME}/vendor/bundle/jruby/3.1.0/gems \
	        ${LOGSTASH_HOME}/vendor/bundle/jruby/3.1.0/plugins \
		${LOGSTASH_HOME}/vendor/jruby/lib/ruby/gems/shared/gems \
		-type d -empty -delete
	${INSTALL} -lrs ${ETCDIR} ${LOGSTASH_HOME}/config
	${INSTALL_DATA} ${FILESDIR}/README.MidnightBSD ${LOGSTASH_HOME}

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/logstash.conf.sample" >> ${TMPPLIST}
.for x in ${LOGSTASH_CONF_FILES}
	${ECHO} "@sample ${ETCDIR_REL}/${x}.sample" >> ${TMPPLIST}
.endfor
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/build_info" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/cache" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/doc" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/extensions" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/jruby/lib/ruby/gems/shared/cache" >> ${TMPPLIST}
	${FIND} -s ${LOGSTASH_HOME} -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir(logstash,logstash,) logstash/data" >> ${TMPPLIST}

.include <bsd.port.mk>
