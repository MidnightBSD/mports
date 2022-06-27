PORTNAME=	cassandra
DISTVERSION=	3.11.11
CATEGORIES=	databases java
MASTER_SITES=	FREEBSD_LOCAL/nc:repo
PKGNAMESUFFIX=	3
DISTFILES=	apache-${PORTNAME}-${DISTVERSION}-repo.tar.gz:repo

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Highly scalable distributed database

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

RUN_DEPENDS=	snappyjava>=0:archivers/snappy-java

USES=		cpe python:3.6+
USE_ANT=	yes
USE_JAVA=	yes
JAVA_VERSION=	1.8
JAVA_VENDOR=	openjdk
CPE_VENDOR=	apache

USE_RC_SUBR=	cassandra

USE_GITHUB=	yes
GH_ACCOUNT=	polo-language
GH_PROJECT=	cassandra
GH_TAGNAME=	0150ddc

NO_TEST=	yes

CONFLICTS=	cassandra4

DATADIR=	${JAVASHAREDIR}/${PORTNAME}

REINPLACE_ARGS=	-i ''
SUB_LIST=	JAVA_HOME=${JAVA_HOME}

USERS=		cassandra
GROUPS=		cassandra

PLIST_SUB=	PORTVERSION=${PORTVERSION}
PORTDOCS=		*

OPTIONS_DEFINE=		SIGAR DOCS
#OPTIONS_DEFAULT=	SIGAR
OPTIONS_SUB=		yes

SIGAR_DESC=		Use SIGAR to collect system information
DOCS_BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinx>=0,1:textproc/py-sphinx@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>0:textproc/py-sphinx_rtd_theme@${PY_FLAVOR}
#SIGAR_RUN_DEPENDS=	java-sigar>=1.6.4:java/sigar

CONFIG_FILES=	cassandra-env.sh \
		cassandra-jaas.config \
		cassandra-rackdc.properties \
		cassandra-topology.properties \
		cassandra.yaml \
		commitlog_archiving.properties \
		hotspot_compiler \
		jvm.options \
		logback-tools.xml \
		logback.xml

DIST_DIR=	${WRKSRC}/build/dist
REPO_DIR=	${WRKDIR}/repository

SCRIPT_FILES=	cassandra \
		cqlsh \
		nodetool \
		sstableloader \
		sstablescrub \
		sstableupgrade \
		sstableutil \
		sstableverify

post-patch:
	@${CHMOD} ug+x ${WRKSRC}/pylib/cassandra-cqlsh-tests.sh
	@${REINPLACE_CMD} -e 's|$${user.home}/.m2/repository/|$${localm2}/|g' ${WRKSRC}/.build/build-resolver.xml

do-build:
	@${DO_NADA} # Do nothing: Prevent USE_ANT from running a default build target.

do-build-DOCS-on:
	@cd ${WRKSRC} && ANT_OPTS="${ANT_OPTS} -Xmx512m" ${ANT} -Dmaven.repo.local=${REPO_DIR} -Dlocalm2=${REPO_DIR} -Dpycmd=${PYTHON_CMD} freebsd-stage-doc

do-build-DOCS-off:
	@cd ${WRKSRC} && ANT_OPTS="${ANT_OPTS} -Xmx512m" ${ANT} -Dmaven.repo.local=${REPO_DIR} -Dlocalm2=${REPO_DIR} freebsd-stage

post-build:
.for f in ${SCRIPT_FILES}
	@${REINPLACE_CMD} -e 's|/usr/share/cassandra|${DATADIR}/bin|' ${DIST_DIR}/bin/${f}
.endfor
	@${REINPLACE_CMD} -e 's|`dirname "$$0"`/..|${DATADIR}|' ${DIST_DIR}/bin/cassandra.in.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/lib/sigar-bin|${JAVAJARDIR}|' ${DIST_DIR}/bin/cassandra.in.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/lib/sigar-bin|${JAVAJARDIR}|' ${DIST_DIR}/conf/cassandra-env.sh
	@${REINPLACE_CMD} -e 's|$$CASSANDRA_HOME/conf|${ETCDIR}|' ${DIST_DIR}/bin/cassandra.in.sh
.for f in ${CONFIG_FILES}
	@${MV} ${DIST_DIR}/conf/${f} ${DIST_DIR}/conf/${f}.sample
.endfor
	-${RM} ${DIST_DIR}/lib/licenses/sigar*
	-${RMDIR} ${DIST_DIR}/lib/sigar-bin

do-install:
	${MKDIR} ${DATADIR}
.for f in CHANGES LICENSE NEWS NOTICE
	cd ${DIST_DIR} && ${INSTALL_DATA} ${f}.txt ${DATADIR}/
.endfor
.for d in interface lib pylib tools
	cd ${DIST_DIR} && ${COPYTREE_SHARE} ${d} ${DATADIR}/ "! -path '*/bin/*'"
.endfor
	${MKDIR} ${ETCDIR}
	cd ${DIST_DIR}/conf && ${COPYTREE_SHARE} . ${ETCDIR}/
	cd ${DIST_DIR} && ${COPYTREE_BIN} bin ${DATADIR}
	cd ${DIST_DIR} && ${INSTALL_DATA} bin/cassandra.in.sh ${DATADIR}/bin/
	cd ${DIST_DIR} && ${COPYTREE_BIN} tools/bin ${DATADIR}/
	cd ${DIST_DIR} && ${INSTALL_DATA} tools/bin/cassandra.in.sh ${DATADIR}/tools/bin/
.for f in ${SCRIPT_FILES}
	${RLN} ${STAGEDIR}${DATADIR}/bin/${f} ${PREFIX}/bin/${f}
.endfor
	${LN} -s ${JAVAJARDIR}/snappy-java.jar ${DATADIR}/lib/snappy-java.jar

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for d in doc javadoc
	cd ${DIST_DIR} && ${COPYTREE_SHARE} ${d} ${FAKE_DESTDIR}${DOCSDIR}/
.endfor

post-install-SIGAR-on:
	${LN} -s ${JAVAJARDIR}/sigar.jar ${FAKE_DESTDIR}${DATADIR}/lib/sigar.jar

.include <bsd.port.mk>
