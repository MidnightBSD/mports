PORTNAME=	grafana
DISTVERSIONPREFIX=	v
DISTVERSION=	13.2.4
PORTREVISION=	1
CATEGORIES=	www
MASTER_SITES=	https://dl.grafana.com/oss/release/ \
		https://raw.githubusercontent.com/${GH_ACCOUNT}/${GH_PROJECT}/${DISTVERSIONFULL}/:gomod
DISTFILES=	grafana-${DISTVERSION}.linux-amd64${EXTRACT_SUFX} \
		go.mod:gomod \
		go.work:gomod \
		apps/advisor/go.mod:gomod \
		apps/alerting/alertenrichment/go.mod:gomod \
		apps/alerting/notifications/go.mod:gomod \
		apps/alerting/alertrulequality/go.mod:gomod \
		apps/alerting/rules/go.mod:gomod \
		apps/annotation/go.mod:gomod \
		apps/collections/go.mod:gomod \
		apps/correlations/go.mod:gomod \
		apps/dashboard/go.mod:gomod \
		apps/dashvalidator/go.mod:gomod \
		apps/example/go.mod:gomod \
		apps/folder/go.mod:gomod \
		apps/iam/go.mod:gomod \
		apps/live/go.mod:gomod \
		apps/logsdrilldown/go.mod:gomod \
		apps/playlist/go.mod:gomod \
		apps/plugins/go.mod:gomod \
		apps/preferences/go.mod:gomod \
		apps/provisioning/go.mod:gomod \
		apps/quotas/go.mod:gomod \
		apps/scope/go.mod:gomod \
		apps/secret/go.mod:gomod \
		apps/shorturl/go.mod:gomod \
		pkg/apimachinery/go.mod:gomod \
		pkg/apiserver/go.mod:gomod \
		pkg/build/wire/go.mod:gomod \
		pkg/codegen/go.mod:gomod \
		pkg/infra/features/go.mod:gomod \
		pkg/plugins/go.mod:gomod \
		pkg/plugins/codegen/go.mod:gomod \
		pkg/storage/unified/resource/kv/go.mod:gomod \
		pkg/storage/unified/resourcepb/go.mod:gomod \
		pkg/util/sqlite/go.mod:gomod
EXTRACT_ONLY=	${DISTFILES:N*.mod\:*:N*.mod:C/:.*//:Ngo.work}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dashboard and graph editor for multiple data stores
WWW=		https://grafana.com/grafana/ \
		https://github.com/grafana/grafana

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64 riscv64

RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		cpe go:1.26+,modules

USE_GITHUB=	yes

USE_RC_SUBR=	grafana
TAG=		af4a33e

GO_MODULE=	github.com/grafana/grafana
GO_MOD_DIST=	github
GO_TARGET=	./pkg/cmd/grafana
GO_BUILDFLAGS=	-ldflags="-w -X main.version=${PORTVERSION} -X main.commit=${TAG}"

CONFLICTS_INSTALL=	grafana

SUB_LIST=	GRAFANA_USER=${GRAFANA_USER} \
		GRAFANA_GROUP=${GRAFANA_GROUP} \
		GRAFANA_DATADIR=${GRAFANA_DATADIR} \
		GRAFANA_HOMEDIR=${GRAFANA_HOMEDIR} \
		GRAFANA_LOGDIR=${GRAFANA_LOGDIR} \
		GRAFANA_PLUGINDIR=${GRAFANA_PLUGINDIR} \
		GRAFANA_PROVISIONINGDIR=${GRAFANA_PROVISIONINGDIR}
# Disable some master port targets
TARGET_ORDER_OVERRIDE=	-1:go-post-extract

GRAFANA_USER?=	grafana
GRAFANA_GROUP?=	grafana

USERS=		${GRAFANA_USER}
GROUPS=		${GRAFANA_GROUP}

PLIST_SUB=	${SUB_LIST}

GRAFANA_DATADIR?=		/var/db/${PORTNAME}
GRAFANA_HOMEDIR?=		${DATADIR}
GRAFANA_LOGDIR?=		/var/log/${PORTNAME}
GRAFANA_PLUGINDIR?=		${GRAFANA_DATADIR}/plugins
GRAFANA_PROVISIONINGDIR?=	${ETCDIR}/provisioning
GRAFANA_PROVISIONING=	access-control alerting dashboards datasources plugins sample

NO_TEST=	yes

# CVE-2026-111497: andybalholm/brotli before 1.2.7 mishandles invalid block
# switches. grafana links it through pkg/tsdb/graphite,
# pkg/tsdb/azuremonitor/loganalytics and arrow-go's parquet compression.
# Fetch the fixed module, then raise the root module's requirement before the
# dependencies are tidied and vendored. In workspace mode the build list is
# the maximum over all go.work modules, so this also covers the v1.2.2
# requirements in apps/dashboard and pkg/plugins. "go get" cannot be used:
# it loads the full module graph, which needs cuelang.org/go v0.11.1 (replaced
# by github.com/grafana/cue in pkg/codegen and so never fetched). "go mod
# edit" does not load the graph, and the tidy step then records the go.sum
# entries from the module cache. The cache entry is checked against GOSUMDB
# at fetch time, so the extract step can trust it offline.
GO_BROTLI_FIX=	github.com/andybalholm/brotli@v1.2.7

post-fetch:
	@(cd ${DISTDIR}/${DIST_SUBDIR}; ${SETENVI} ${WRK_ENV} ${GO_ENV} \
		GOPROXY=${GO_GOPROXY} ${GO_CMD} mod download -x ${GO_BROTLI_FIX})

post-extract:
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		${GO_CMD} mod edit -require=${GO_BROTLI_FIX})
	@${ECHO_MSG} "===> Tidying ${GO_MODNAME} dependencies";
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		GOPROXY=${GO_MODCACHE} GONOSUMDB=${GO_BROTLI_FIX:C/@.*//} \
		${GO_CMD} mod tidy -e)
	@${ECHO_MSG} "===> Vendoring ${GO_MODNAME} dependencies";
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		GOPROXY=${GO_MODCACHE} ${GO_CMD} work vendor -e)

post-patch:
	@${REINPLACE_CMD} \
		-e 's|;data = /var/lib/grafana|data = ${GRAFANA_DATADIR}|g' \
		-e 's|;logs = /var/log/grafana|logs = ${GRAFANA_LOGDIR}|g' \
		-e 's|;plugins = /var/lib/grafana/plugins|plugins = ${GRAFANA_PLUGINDIR}|g' \
		-e 's|;provisioning = conf/provisioning|provisioning = ${GRAFANA_PROVISIONINGDIR}|g' \
		 ${WRKSRC}/conf/sample.ini

pre-build:
	@(cd ${GO_WRKSRC}; \
	${ECHO_MSG} "===>  Generating wire_gen.go"; \
	${SETENV} ${MAKE_ENV} ${GO_ENV} GOPROXY=off ${GO_CMD} run \
		./pkg/build/wire/cmd/wire/main.go gen -tags "oss" ./pkg/server)

post-install:
	${MKDIR} ${GRAFANA_HOMEDIR}/conf \
		${FAKE_DESTDIR}${GRAFANA_DATADIR} \
		${FAKE_DESTDIR}${GRAFANA_PLUGINDIR} \
		${FAKE_DESTDIR}${GRAFANA_LOGDIR} \
		${GRAFANA_PROVISIONING:M*:C|^|${GRAFANA_PROVISIONINGDIR}/|}
	(cd ${WRKSRC} \
		&& ${COPYTREE_SHARE} public ${GRAFANA_HOMEDIR})
	${INSTALL_DATA} ${WRKSRC}/conf/defaults.ini \
		${GRAFANA_HOMEDIR}/conf/defaults.ini
	${INSTALL_DATA} ${WRKSRC}/conf/sample.ini \
		${ETCDIR}/grafana.ini.sample
	${INSTALL_DATA} ${WRKSRC}/conf/ldap.toml \
		${ETCDIR}/ldap.toml.sample
	${FIND} ${DATADIR}/public -type f | \
		${SED} "s,^${DATADIR},${DATADIR_REL}," >> ${TMPPLIST}

.include <bsd.port.mk>
