PORTNAME=	cassandra
DISTVERSION=	4.0-beta2
CATEGORIES=	databases java
MASTER_SITES=	https://archive.apache.org/dist/${PORTNAME}/${DISTVERSION}/:apache \
		https://repo1.maven.org/maven2/com/github/luben/zstd-jni/1.4.5-4/:maven \
		FREEBSD_LOCAL/mikael:repo
PKGNAMESUFFIX=	4
DISTNAME=	apache-${PORTNAME}-${DISTVERSION}-src
DISTFILES=	${DISTNAME}.tar.gz:apache \
		${ZSTD_DISTFILE} \
		apache-${PORTNAME}-${DISTVERSION}-repo.tar.gz:repo
EXTRACT_ONLY=	${DISTNAME}.tar.gz \
		apache-${PORTNAME}-${DISTVERSION}-repo.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Highly scalable distributed database
WWW=		https://cassandra.apache.org/

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

FETCH_DEPENDS=        ant:devel/apache-ant
RUN_DEPENDS=	snappyjava>=0:archivers/snappy-java \
		netty>0:java/netty

USES=		cpe java:ant python
USE_RC_SUBR=	cassandra
NO_TEST=	yes

CONFLICTS=	cassandra3

JAVA_VERSION=	8 11
JAVA_VENDOR=	openjdk

SUB_LIST=	JAVA_HOME=${JAVA_HOME}

USERS=		cassandra
GROUPS=		cassandra

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
BUILD_DIST_DIR=	${WRKSRC}/build/dist
REPO_DIR=	${WRKDIR}/repository

CONFIG_FILES=	cassandra-env.sh \
		cassandra-jaas.config \
		cassandra-rackdc.properties \
		cassandra-topology.properties \
		cassandra.yaml \
		commitlog_archiving.properties \
		hotspot_compiler \
		logback-tools.xml \
		logback.xml \
		jvm8-clients.options \
		jvm8-server.options \
		jvm11-clients.options \
		jvm11-server.options \
		jvm-clients.options \
		jvm-server.options

SCRIPT_FILES=	cassandra \
		nodetool \
		sstableloader \
		sstablescrub \
		sstableupgrade \
		sstableutil \
		sstableverify

ZSTDJNI_VERSION=${MASTER_SITES:M*\:maven:H:T}
PLIST_SUB=	DISTVERSION=${DISTVERSION} ZSTDJNI_VERSION=${ZSTDJNI_VERSION}

OPTIONS_DEFINE=		SIGAR DOCS
#OPTIONS_DEFAULT=	SIGAR
OPTIONS_SUB=		yes

SIGAR_DESC=		Use SIGAR to collect system information
SIGAR_RUN_DEPENDS=	java-sigar>=1.6.4:java/sigar

DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR}

PORTDOCS=		*

do-build:
	@${DO_NADA} # Do nothing: Prevent USE_ANT from running a default build target.

do-build-DOCS-on:
	cd ${WRKSRC} && ${SETENV} CASSANDRA_LOG_DIR=${WRKDIR}/gen-doc-log ${ANT} -Dmaven.repo.local=${REPO_DIR} -Dlocalm2=${REPO_DIR} ${USEJDK11} -Dpycmd=${PYTHON_CMD} -Dpyver=${PYTHON_VER} freebsd-stage-doc

do-build-DOCS-off:
	cd ${WRKSRC} && ${ANT} -Dmaven.repo.local=${REPO_DIR} -Dlocalm2=${REPO_DIR} ${USEJDK11} freebsd-stage

post-build:
.for f in ${SCRIPT_FILES}
	@${REINPLACE_CMD} -e 's|/usr/share/cassandra|${DATADIR}/bin|' ${BUILD_DIST_DIR}/bin/${f}
.endfor
	@${REINPLACE_CMD} -e 's|`dirname "$$0"`/..|${DATADIR}|' ${BUILD_DIST_DIR}/bin/cassandra.in.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/lib/sigar-bin|${JAVAJARDIR}|' ${BUILD_DIST_DIR}/bin/cassandra.in.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/lib/sigar-bin|${JAVAJARDIR}|' ${BUILD_DIST_DIR}/conf/cassandra-env.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/conf|${ETCDIR}|' ${BUILD_DIST_DIR}/bin/cassandra.in.sh
.for f in ${CONFIG_FILES}
	@${MV} ${BUILD_DIST_DIR}/conf/${f} ${BUILD_DIST_DIR}/conf/${f}.sample
.endfor
	@${RM} ${BUILD_DIST_DIR}/lib/licenses/sigar*
	@${RMDIR} ${BUILD_DIST_DIR}/lib/sigar-bin
	@${RM} ${BUILD_DIST_DIR}/lib/zstd-jni*
	@${RM} ${BUILD_DIST_DIR}/lib/licenses/zstd-jni*

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}
.for f in CHANGES LICENSE NEWS NOTICE
	cd ${BUILD_DIST_DIR} && ${INSTALL_DATA} ${f}.txt ${STAGEDIR}${DATADIR}/
.endfor
.for d in lib pylib tools
	cd ${BUILD_DIST_DIR} && ${COPYTREE_SHARE} ${d} ${STAGEDIR}${DATADIR}/ "! -path '*/bin/*'"
.endfor
	${MKDIR} ${STAGEDIR}${ETCDIR}
	cd ${BUILD_DIST_DIR}/conf && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/
	cd ${BUILD_DIST_DIR} && ${COPYTREE_BIN} bin ${STAGEDIR}${DATADIR}
	cd ${BUILD_DIST_DIR} && ${INSTALL_DATA} bin/cassandra.in.sh ${STAGEDIR}${DATADIR}/bin/
	cd ${BUILD_DIST_DIR} && ${COPYTREE_BIN} tools/bin ${STAGEDIR}${DATADIR}/
	cd ${BUILD_DIST_DIR} && ${INSTALL_DATA} tools/bin/cassandra.in.sh ${STAGEDIR}${DATADIR}/tools/bin/
.for f in ${SCRIPT_FILES}
	${RLN} ${STAGEDIR}${DATADIR}/bin/${f} ${STAGEDIR}${PREFIX}/bin/${f}
.endfor
	${RLN} ${STAGEDIR}${DATADIR}/bin/cqlsh ${STAGEDIR}${PREFIX}/bin/cqlsh
	${LN} -s ${JAVAJARDIR}/snappy-java.jar ${STAGEDIR}${DATADIR}/lib/snappy-java.jar

.include <bsd.port.pre.mk>

.if ${JAVA_PORT_VERSION} == 11
USEJDK11=	-Duse.jdk11=true
.endif

.if ${ARCH} == amd64
PLIST_SUB+=		AMD64ONLY=""
PLIST_SUB+=		I386ONLY="@comment "
.elif ${ARCH} == i386
PLIST_SUB+=		AMD64ONLY="@comment "
PLIST_SUB+=		I386ONLY=""
.else
PLIST_SUB+=		AMD64ONLY="@comment "
PLIST_SUB+=		I386ONLY="@comment "
.endif

.if ${ARCH} == amd64 || ${ARCH} == i386
ZSTD_DISTFILE=	zstd-jni-${MASTER_SITES:M*\:maven:H:T}-freebsd_${ARCH}.jar:maven
.else
ZSTD_DISTFILE=
.endif

post-install:
	${LN} -s ${JAVAJARDIR}/netty.jar ${STAGEDIR}${DATADIR}/lib/netty.jar
.if ${ARCH} == amd64 || ${ARCH} == i386
	${CP} ${DISTDIR}/zstd-jni-${ZSTDJNI_VERSION}-freebsd_${ARCH}.jar ${STAGEDIR}${DATADIR}/lib/
.endif

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for d in doc javadoc
	cd ${BUILD_DIST_DIR} && ${COPYTREE_SHARE} ${d} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

post-install-SIGAR-on:
	${LN} -s ${JAVAJARDIR}/sigar.jar ${FAKE_DESTDIR}${DATADIR}/lib/sigar.jar

.include <bsd.port.post.mk>
