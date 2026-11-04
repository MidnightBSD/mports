PORTNAME=	opensearch-dashboards
DISTVERSION?=	3.6.0
PORTREVISION=	1
DISTVERSIONSUFFIX=	-linux-x64
CATEGORIES=	textproc www
MASTER_SITES=	https://artifacts.opensearch.org/releases/bundle/${PORTNAME}/${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT?=	Visualization dashboards for OpenSearch
WWW=		https://opensearch.org

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

CONFLICTS?=	opensearch-dashboards210 opensearch-dashboards213 opensearch-dashboards216 opensearch-dashboards217

BUILD_DEPENDS=	npm-node22>0:www/npm-node22

USES=		nodejs:22,build,run python:build
USE_RC_SUBR=	${PORTNAME}

SUB_FILES=	pkg-deinstall
SUB_LIST=	PORTNAME="${PORTNAME}" \
		PKGNAMESUFFIX="${PKGNAMESUFFIX}" \
		WWWDIR=${WWWDIR}

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

NODE_VER=	22.22.0
NO_BUILD=	yes

_DEVDIR=	${WRKDIR}/.devdir

post-patch:
	@${REINPLACE_CMD} -e 's|14.20.1|${NODE_VER}|g' ${WRKSRC}/package.json
	-${RM} \
		${WRKSRC}/bin/*.orig \
		${WRKSRC}/bin/*.bak \
		${WRKSRC}/package.json.bak
	-${RM} -r ${WRKSRC}/plugins/reportsDashboards/.chromium

do-install:
	${MKDIR} ${WWWDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/config/opensearch_dashboards.yml ${ETCDIR}/opensearch_dashboards.yml.sample
	(cd ${WRKSRC} && \
		${COPYTREE_SHARE} "data node_modules package.json plugins src" ${WWWDIR} && \
		${COPYTREE_BIN} bin ${WWWDIR})
	${FIND} ${FAKE_DESTDIR}${TRUE_PREFIX} -type f -iname '*.bak' -delete

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/opensearch_dashboards.yml.sample" >> ${TMPPLIST}
	${FIND} -s ${WWWDIR} -not -type d | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir(www,www) ${WWWDIR_REL}/data" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/reportsDashboards/node_modules/set-interval-async/test/resources/legacy" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/reportsDashboards/node_modules/set-interval-async/test/resources/fixed" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/reportsDashboards/node_modules/set-interval-async/test/resources/dynamic" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/reportsDashboards/node_modules/set-interval-async/examples/fixed" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/reportsDashboards/node_modules/set-interval-async/examples/dynamic" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/observabilityDashboards/server/adaptors/integrations/__test__" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/observabilityDashboards/server/adaptors/integrations/repository/__test__" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Alerts/components/AlertFlyout" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/CreateDetector/components/ConfigureAlerts/components/AlertCondition" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/AlertTriggerView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/DetectorBasicDetailsView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/DetectorRulesView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/FieldMappingsView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/UpdateAlertConditions" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/UpdateDetectorBasicDetails" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/UpdateDetectorRules" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/components/UpdateFieldMappings" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/containers/AlertTriggersView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/containers/DetectorDetails" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/containers/DetectorDetailsView" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/containers/Detectors" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Detectors/containers/EditFieldMappings" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Rules/components/DeleteModal" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Rules/components/RuleEditor/components" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityAnalyticsDashboards/test/mocks/Rules/components/RulesTable" >> ${TMPPLIST}
	${ECHO} "@dir ${WWWDIR_REL}/plugins/securityDashboards/server/multitenancy/test" >> ${TMPPLIST}

.include <bsd.port.mk>
