PORTNAME=	grafana
DISTVERSIONPREFIX=	v
DISTVERSION=	11.6.0
CATEGORIES=	www
MASTER_SITES=	https://dl.grafana.com/oss/release/ \
		https://raw.githubusercontent.com/${GH_ACCOUNT}/${GH_PROJECT}/${DISTVERSIONFULL}/:gomod
DISTFILES=	grafana-${DISTVERSION}.linux-amd64${EXTRACT_SUFX} \
		go.mod:gomod \
		go.work:gomod \
		apps/advisor/go.mod:gomod \
		apps/alerting/notifications/go.mod:gomod \
		apps/investigations/go.mod:gomod \
		apps/playlist/go.mod:gomod \
		pkg/aggregator/go.mod:gomod \
		pkg/apimachinery/go.mod:gomod \
		pkg/apiserver/go.mod:gomod \
		pkg/build/go.mod:gomod \
		pkg/build/wire/go.mod:gomod \
		pkg/codegen/go.mod:gomod \
		pkg/plugins/codegen/go.mod:gomod \
		pkg/promlib/go.mod:gomod \
		pkg/semconv/go.mod:gomod \
		pkg/storage/unified/apistore/go.mod:gomod \
		pkg/storage/unified/resource/go.mod:gomod \
		pkg/util/xorm/go.mod:gomod
EXTRACT_ONLY=	${DISTFILES:N*.mod\:*:N*.mod:C/:.*//:Ngo.work}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dashboard and graph editor for multiple data stores
WWW=		https://grafana.com/grafana/ \
		https://github.com/grafana/grafana

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/LICENSE

ONLY_FOR_ARCHS=	aarch64 amd64 i386 riscv64

RUN_DEPENDS=	ca_root_nss>=0:security/ca_root_nss

USES=		cpe go:1.23,modules

USE_GITHUB=	yes

USE_RC_SUBR=	grafana
TAG=		d2fdff9

GO_MODULE=	github.com/grafana/grafana
GO_MOD_DIST=	github
GO_TARGET=	./pkg/cmd/grafana \
		./pkg/cmd/grafana-server \
		./pkg/cmd/grafana-cli
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

NO_TEST=	yes

post-extract:
	@${ECHO_MSG} "===> Tidying ${GO_MODNAME} dependencies";
	@(cd ${GO_WRKSRC}; ${SETENVI} ${WRK_ENV} ${MAKE_ENV} ${GO_ENV} \
		GOPROXY=${GO_MODCACHE} ${GO_CMD} mod tidy -e)
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
	${MKDIR} ${ETCDIR}
	${MKDIR} ${GRAFANA_HOMEDIR}
	${MKDIR} ${GRAFANA_HOMEDIR}/conf
	${MKDIR} ${FAKE_DESTDIR}${GRAFANA_DATADIR}
	${MKDIR} ${FAKE_DESTDIR}${GRAFANA_PLUGINDIR}
.for dir in access-control alerting dashboards datasources plugins
	${MKDIR} ${FAKE_DESTDIR}${GRAFANA_PROVISIONINGDIR}/${dir}
.endfor
	${MKDIR} ${FAKE_DESTDIR}${GRAFANA_LOGDIR}
	(cd ${WRKDIR}/${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX} \
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
