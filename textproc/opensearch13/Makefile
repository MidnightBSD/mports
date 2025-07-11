PORTNAME=	opensearch
DISTVERSION=	1.3.10
DISTVERSIONSUFFIX=	-linux-x64
CATEGORIES=	textproc java devel
MASTER_SITES=	https://artifacts.opensearch.org/releases/bundle/${PORTNAME}/${DISTVERSION}/
PKGNAMESUFFIX=	13

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-text search engine for Java
WWW=		https://opensearch.org

LICENSE=	Apache-2.0

BUILD_DEPENDS=	jna>0:devel/jna
RUN_DEPENDS=	bash>0:shells/bash \
		jna>0:devel/jna

CONFLICTS=	opensearch

USES=		cpe java shebangfix
JAVA_VERSION=	11+
USE_RC_SUBR=	${PORTNAME}

SHEBANG_FILES=	bin/opensearch bin/opensearch-cli \
		bin/opensearch-env bin/opensearch-env-from-file \
		bin/opensearch-keystore bin/opensearch-node \
		bin/opensearch-plugin bin/opensearch-shard \
		plugins/opensearch-security/tools/audit_config_migrater.sh \
		plugins/opensearch-security/tools/hash.sh \
		plugins/opensearch-security/tools/install_demo_configuration.sh \
		plugins/opensearch-security/tools/securityadmin.sh

NO_BUILD=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

OPTIONS_DEFINE=	PLUGINS
OPTIONS_DEFAULT=PLUGINS

.include <bsd.mport.options.mk>

CONFIG_FILES=	opensearch.yml jvm.options log4j2.properties

PLUGINS_CONFIG_FILES?= \
		opensearch-observability/observability.yml \
		opensearch-performance-analyzer/agent-stats-metadata \
		opensearch-performance-analyzer/log4j2.xml \
		opensearch-performance-analyzer/opensearch_security.policy \
		opensearch-performance-analyzer/performance-analyzer.properties \
		opensearch-performance-analyzer/plugin-stats-metadata \
		opensearch-performance-analyzer/rca.conf \
		opensearch-performance-analyzer/rca_idle_master.conf \
		opensearch-performance-analyzer/rca_master.conf \
		opensearch-performance-analyzer/supervisord.conf \
		opensearch-reports-scheduler/reports-scheduler.yml \

BINS=		opensearch opensearch-cli opensearch-env \
		opensearch-env-from-file opensearch-keystore \
		opensearch-node opensearch-plugin \
		opensearch-shard

SEARCHUSER?=	opensearch
SEARCHGROUP?=	${SEARCHUSER}
USERS=		${SEARCHUSER}
GROUPS=		${SEARCHGROUP}

SUB_FILES=	pkg-message
SUB_LIST=	ETCDIR=${ETCDIR} \
		JAVA_HOME=${JAVA_HOME}

post-patch:
	${RM} ${WRKSRC}/lib/jna-*.jar

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/etc/opensearch
.for f in ${CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f} ${PREFIX}/${ETCDIR_REL}/${f}.sample
.endfor
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/opensearch/bin
.for f in ${BINS}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${STAGEDIR}${PREFIX}/lib/opensearch/bin
.endfor
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/opensearch/lib
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} "lib modules" ${STAGEDIR}${PREFIX}/lib/opensearch/)
	${MKDIR} ${STAGEDIR}${PREFIX}/libexec/opensearch
	${INSTALL} -lrs ${STAGEDIR}${ETCDIR} ${STAGEDIR}${PREFIX}/lib/opensearch/config
	${LN} -s ${JAVASHAREDIR}/classes/jna.jar ${STAGEDIR}${PREFIX}/lib/opensearch/lib/jna.jar

do-install-PLUGINS-on:
	${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/opensearch-observability \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-performance-analyzer \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-reports-scheduler
.for f in ${PLUGINS_CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f} ${FAKE_DESTDIR}${ETCDIR}/${f}.sample
	${ECHO} "@sample ${ETCDIR_REL}/${f}.sample" >> ${TMPPLIST}
.endfor
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} "plugins" ${FAKE_DESTDIR}${PREFIX}/lib/opensearch/)
	(cd ${WRKSRC}/plugins/opensearch-security/tools && ${COPYTREE_BIN} "*.sh" ${FAKE_DESTDIR}${PREFIX}/lib/opensearch/plugins/opensearch-security/tools)

post-install:
.for f in ${CONFIG_FILES}
	${ECHO} "@sample ${ETCDIR_REL}/${f}.sample" >> ${TMPPLIST}
.endfor
	${FIND} -s ${PREFIX}/lib/opensearch -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir lib/opensearch/plugins" >> ${TMPPLIST}
	${ECHO} "@dir libexec/opensearch" >> ${TMPPLIST}
	${ECHO} "@dir(opensearch,opensearch,0755) ${ETCDIR}" >> ${TMPPLIST}

.include <bsd.port.mk>
