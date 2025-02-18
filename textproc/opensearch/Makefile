PORTNAME=	opensearch
DISTVERSION?=	2.17.1
PORTREVISION?=	1
DISTVERSIONSUFFIX=	-linux-x64
CATEGORIES=	textproc java devel
MASTER_SITES=	https://artifacts.opensearch.org/releases/bundle/${PORTNAME}/${DISTVERSION}/
PKGNAMESUFFIX?=	#

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Full-text search engine for Java
WWW=		https://opensearch.org

LICENSE=	apache2

BUILD_DEPENDS=	jna>0:devel/jna
RUN_DEPENDS=	bash>0:shells/bash \
		jna>0:devel/jna

CONFLICTS?=	opensearch13 opensearch210 opensearch213 opensearch216

USES=		cpe java shebangfix
JAVA_VERSION=	17+
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
		opensearch-notifications-core/notifications-core.yml \
		opensearch-notifications/notifications.yml \
		opensearch-observability/observability.yml
.if ${PKGNAMESUFFIX} == "210" || ${PKGNAMESUFFIX} == "213" || ${PKGNAMESUFFIX} == "216"
PLUGINS_CONFIG_FILES+=	\
		opensearch-performance-analyzer/agent-stats-metadata \
		opensearch-performance-analyzer/log4j2.xml \
		opensearch-performance-analyzer/opensearch_security.policy \
		opensearch-performance-analyzer/performance-analyzer.properties \
		opensearch-performance-analyzer/plugin-stats-metadata \
		opensearch-performance-analyzer/rca.conf \
		opensearch-performance-analyzer/rca_idle_cluster_manager.conf \
		opensearch-performance-analyzer/rca_cluster_manager.conf \
		opensearch-performance-analyzer/supervisord.conf
.endif
PLUGINS_CONFIG_FILES+= \
		opensearch-reports-scheduler/reports-scheduler.yml \
		opensearch-security/action_groups.yml \
		opensearch-security/allowlist.yml \
		opensearch-security/audit.yml \
		opensearch-security/config.yml \
		opensearch-security/internal_users.yml \
		opensearch-security/nodes_dn.yml \
		opensearch-security/roles.yml \
		opensearch-security/roles_mapping.yml \
		opensearch-security/tenants.yml \
		opensearch-security/whitelist.yml

# Upstream provide some *.example files.  These are also copied as sample filse
# but we do not register them as @sample to avoid installing filse that needs
# to be tuned a site specific way.
PLUGINS_SAMPLE_CONFIG_FILES= \
		opensearch-security/opensearch.yml

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
	${MKDIR} ${PREFIX}/etc/opensearch
.for f in ${CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f} ${ETCDIR}/${f}.sample
.endfor
	${MKDIR} ${PREFIX}/lib/opensearch/bin
.for f in ${BINS}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${PREFIX}/lib/opensearch/bin
.endfor
	${MKDIR} ${PREFIX}/lib/opensearch/extensions
	${MKDIR} ${PREFIX}/lib/opensearch/lib
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} "lib modules" ${PREFIX}/lib/opensearch/)
	${MKDIR} ${PREFIX}/libexec/opensearch
	${INSTALL} -lrs ${ETCDIR} ${PREFIX}/lib/opensearch/config
	${LN} -s ${JAVASHAREDIR}/classes/jna.jar ${PREFIX}/lib/opensearch/lib/jna.jar

do-install-PLUGINS-on:
	${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/opensearch-notifications-core \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-notifications \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-observability \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-reports-scheduler \
		 ${FAKE_DESTDIR}${ETCDIR}/opensearch-security
.if ${PKGNAMESUFFIX} == "210" || ${PKGNAMESUFFIX} == "213" || ${PKGNAMESUFFIX} == "216"
	${MKDIR} ${FAKE_DESTDIR}${ETCDIR}/opensearch-performance-analyzer
.endif

.for f in ${PLUGINS_CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f} ${FAKE_DESTDIR}${ETCDIR}/${f}.sample
	${ECHO} "@sample ${ETCDIR}/${f}.sample" >> ${TMPPLIST}
.endfor
.for f in ${PLUGINS_SAMPLE_CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f}.example ${FAKE_DESTDIR}${ETCDIR}/${f}.sample
	${ECHO} "${ETCDIR}/${f}.sample" >> ${TMPPLIST}
.endfor
	(cd ${WRKSRC}/ && ${COPYTREE_SHARE} "plugins" ${FAKE_DESTDIR}${PREFIX}/lib/opensearch/)
	(cd ${WRKSRC}/plugins/opensearch-security/tools && ${COPYTREE_BIN} "*.sh" ${FAKE_DESTDIR}${PREFIX}/lib/opensearch/plugins/opensearch-security/tools)

post-install:
.for f in ${CONFIG_FILES}
	${ECHO} "@sample ${ETCDIR_REL}/${f}.sample" >> ${TMPPLIST}
.endfor
	${FIND} -s ${PREFIX}/lib/opensearch -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir lib/opensearch/extensions" >> ${TMPPLIST}
	${ECHO} "@dir libexec/opensearch" >> ${TMPPLIST}
.if ${PORT_OPTIONS:MPLUGINS}
	${ECHO} "@dir lib/opensearch/plugins" >> ${TMPPLIST}
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-notifications-core" >> ${TMPPLIST}
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-notifications" >> ${TMPPLIST}
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-observability" >> ${TMPPLIST}
.if ${PKGNAMESUFFIX} == "210" || ${PKGNAMESUFFIX} == "213" || ${PKGNAMESUFFIX} == "216"
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-performance-analyzer" >> ${TMPPLIST}
.endif
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-reports-scheduler" >> ${TMPPLIST}
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/opensearch-security" >> ${TMPPLIST}
.endif
	${ECHO} "@dir(opensearch,opensearch,0750) ${ETCDIR_REL}/" >> ${TMPPLIST}

.include <bsd.port.mk>
