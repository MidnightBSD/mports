PORTNAME=	crowdsec
DISTVERSIONPREFIX=	v
DISTVERSION=	1.6.3
PORTREVISION=	0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CrowdSec lightweight and collaborative security engine
WWW=		https://github.com/crowdsecurity/crowdsec

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libabsl_base.so:devel/abseil \
		libre2.so:devel/re2

NO_TEST=	yes

USES=		go:1.22,modules pkgconfig
_COMMIT=	4851945a
_BUILD_DATE=	$$(date -u "+%F_%T")
USE_RC_SUBR=	crowdsec

GO_MODULE=	github.com/crowdsecurity/crowdsec
GO_TARGET=	./cmd/crowdsec \
		./cmd/crowdsec-cli \
		./cmd/notification-email \
		./cmd/notification-http \
		./cmd/notification-sentinel \
		./cmd/notification-slack \
		./cmd/notification-splunk

GO_BUILDFLAGS=	-v -trimpath -tags netgo,osusergo,sqlite_omit_load_extension,re2_cgo \
		-ldflags="\
		-a -s -w \
		-X github.com/crowdsecurity/go-cs-lib/version.Version=${DISTVERSIONPREFIX}${DISTVERSION} \
		-X github.com/crowdsecurity/go-cs-lib/version.BuildDate=${_BUILD_DATE} \
		-X github.com/crowdsecurity/go-cs-lib/version.Tag=${_COMMIT} \
		-X ${GO_MODULE}/pkg/cwversion.Codename=alphaga \
		-X ${GO_MODULE}/pkg/csconfig.defaultConfigDir=${PREFIX}/etc/crowdsec \
		-X ${GO_MODULE}/pkg/csconfig.defaultDataDir=/var/db/crowdsec/data \
		-X ${GO_MODULE}/pkg/cwversion.Libre2=C++"

SUB_FILES=	pkg-deinstall pkg-install pkg-message crowdsec.cron upgrade-hub

OPTIONS_DEFINE=	FIREWALL_BOUNCER
OPTIONS_DEFAULT=

FIREWALL_BOUNCER_DESC=	Depend on security/crowdsec-firewall-bouncer
FIREWALL_BOUNCER_RUN_DEPENDS=	crowdsec-firewall-bouncer>=0.0.27:security/crowdsec-firewall-bouncer

PLUGIN_DIR=	${PREFIX}/lib/crowdsec/plugins
STAGE_PLUGINS=	${PLUGIN_DIR}
STAGE_BIN=	${PREFIX}/bin

post-patch:
	@${REINPLACE_CMD} 's,/etc/crowdsec/,${ETCDIR}/,g' \
		${WRKSRC}/config/config.yaml

	@${REINPLACE_CMD} 's,/var/lib/,/var/db/,g' \
		${WRKSRC}/config/config.yaml

do-install:
	#
	# Binaries
	#

	${INSTALL_PROGRAM} ${WRKDIR}/bin/crowdsec ${STAGE_BIN}/
	${INSTALL_PROGRAM} ${WRKDIR}/bin/crowdsec-cli ${STAGE_BIN}/cscli

	# keep this around for compatibility
	${LN} -s cscli ${STAGE_BIN}/crowdsec-cli

	@${MKDIR} ${STAGE_PLUGINS}
	${INSTALL_PROGRAM} ${WRKDIR}/bin/notification-email ${STAGE_PLUGINS}/
	${INSTALL_PROGRAM} ${WRKDIR}/bin/notification-http ${STAGE_PLUGINS}/
	${INSTALL_PROGRAM} ${WRKDIR}/bin/notification-sentinel ${STAGE_PLUGINS}/
	${INSTALL_PROGRAM} ${WRKDIR}/bin/notification-slack ${STAGE_PLUGINS}/
	${INSTALL_PROGRAM} ${WRKDIR}/bin/notification-splunk ${STAGE_PLUGINS}/

	#
	# Configuration
	#

	@${MKDIR} ${ETCDIR}
	@(cd ${WRKSRC}/config && ${COPYTREE_SHARE} . ${ETCDIR})

	@${MV} ${ETCDIR}/acquis.yaml \
		${ETCDIR}/acquis.yaml.sample

	@${MV} ${ETCDIR}/config.yaml \
		${ETCDIR}/config.yaml.sample

	@${MV} ${ETCDIR}/console.yaml \
		${ETCDIR}/console.yaml.sample

	@${MV} ${ETCDIR}/profiles.yaml \
		${ETCDIR}/profiles.yaml.sample

	# managed by "cscli simulation"
	@${MV} ${ETCDIR}/simulation.yaml \
		${ETCDIR}/simulation.yaml.sample

	#
	# Plugin configuration
	#

	@${MKDIR} ${ETCDIR}/notifications

	@${MKDIR} ${ETCDIR}/notifications/email
	@${MV} ${WRKSRC}/cmd/notification-email/email.yaml \
		${ETCDIR}/notifications/email.yaml.sample

	@${MKDIR} ${ETCDIR}/notifications/http
	@${MV} ${WRKSRC}/cmd/notification-http/http.yaml \
		${ETCDIR}/notifications/http.yaml.sample

	@${MKDIR} ${ETCDIR}/notifications/sentinel
	@${MV} ${WRKSRC}/cmd/notification-sentinel/sentinel.yaml \
		${ETCDIR}/notifications/sentinel.yaml.sample

	@${MKDIR} ${ETCDIR}/notifications/slack
	@${MV} ${WRKSRC}/cmd/notification-slack/slack.yaml \
		${ETCDIR}/notifications/slack.yaml.sample

	@${MKDIR} ${ETCDIR}/notifications/splunk
	@${MV} ${WRKSRC}/cmd/notification-splunk/splunk.yaml \
		${ETCDIR}/notifications/splunk.yaml.sample

	# updated by "cscli machines" at first service start
	@${MV} ${ETCDIR}/local_api_credentials.yaml \
		${ETCDIR}/local_api_credentials.yaml.sample

	# updated by "cscli capi" at first service start
	@${MV} ${ETCDIR}/online_api_credentials.yaml \
		${ETCDIR}/online_api_credentials.yaml.sample

	#
	# Data
	#

	@${MKDIR} ${ETCDIR}/hub
	@${MKDIR} ${ETCDIR}/acquis.d
	@${MKDIR} /var/db/crowdsec/data
	@${MKDIR} /var/db/crowdsec/data/trace

	#
	# Cron
	#

	@${MKDIR} ${PREFIX}/libexec/crowdsec
	${INSTALL_DATA} ${WRKDIR}/upgrade-hub \
		${PREFIX}/libexec/crowdsec/upgrade-hub

	#
	# Cleanup
	#

	@${RM} ${ETCDIR}/acquis_win.yaml
	@${RM} ${ETCDIR}/config_win_no_lapi.yaml
	@${RM} ${ETCDIR}/config_win.yaml
	@${RM} ${ETCDIR}/crowdsec.cron.daily
	@${RM} ${ETCDIR}/crowdsec.service
	@${RM} ${ETCDIR}/context.yaml
	@${RM} ${ETCDIR}/detect.yaml
	@${RM} ${ETCDIR}/dev.yaml
	@${RM} ${ETCDIR}/user.yaml
	@${RMDIR} ${ETCDIR}/notifications/email
	@${RMDIR} ${ETCDIR}/notifications/http
	@${RMDIR} ${ETCDIR}/notifications/sentinel
	@${RMDIR} ${ETCDIR}/notifications/slack
	@${RMDIR} ${ETCDIR}/notifications/splunk

post-install:
	@${MKDIR} ${PREFIX}/etc/cron.d
	${INSTALL_DATA} ${WRKDIR}/crowdsec.cron ${PREFIX}/etc/cron.d/crowdsec

.include <bsd.port.mk>
