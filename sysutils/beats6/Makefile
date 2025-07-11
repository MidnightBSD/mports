PORTNAME=	beats
PORTVERSION=	6.8.16
DISTVERSIONPREFIX=v
CATEGORIES=	sysutils
PKGNAMESUFFIX=	6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collect logs locally and send to remote logstash

LICENSE=	Apache-2.0

USES=		gmake go
USE_GITHUB=	yes
GH_ACCOUNT=	elastic
USE_RC_SUBR=	${GO_TARGETS}

CONFLICTS=	beats7*

GO_PKGNAME=	github.com/${GH_ACCOUNT}/${GH_PROJECT}
FIND_ARGS=	"! ( -regex .*/*\.(go|in|log) ) ! -path *test* ! -path *vendor*"
MAKE_ENV+=	GOBUILD_FLAGS=""

OPTIONS_DEFAULT=FILEBEAT HEARTBEAT METRICBEAT
OPTIONS_DEFINE=	FILEBEAT HEARTBEAT METRICBEAT PACKETBEAT
OPTIONS_SUB=	yes

FILEBEAT_DESC=	Filebeat
FILEBEAT_VARS=	GO_TARGETS+=filebeat

PACKETBEAT_DESC=Packetbeat
PACKETBEAT_VARS=GO_TARGETS+=packetbeat
PACKETBEAT_BROKEN=	An underlying library is currently broken under BSD

METRICBEAT_DESC=Metricbeat
METRICBEAT_VARS=GO_TARGETS+=metricbeat

HEARTBEAT_DESC=	Heartbeat
HEARTBEAT_VARS=	GO_TARGETS+=heartbeat

NO_TEST=	yes

.include <bsd.mport.options.mk>

do-build:
.for GO_TARGET in ${GO_TARGETS}
	@(cd ${GO_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GO_ENV} ${GMAKE} -C ${GO_TARGET})
.endfor

do-install:
.for GO_TARGET in ${GO_TARGETS}
	${INSTALL_PROGRAM} ${GO_WRKSRC}/${GO_TARGET}/${GO_TARGET} \
		${STAGEDIR}${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/${GO_TARGET}/${GO_TARGET}.yml \
		${STAGEDIR}${PREFIX}/etc/${GO_TARGET}.yml.sample
	(DEST_COMPONENT_PATH_UNSTAGED=/var/db/beats/${GO_TARGET}/kibana; \
		DEST_COMPONENT_PATH=${FAKE_DESTDIR}$${DEST_COMPONENT_PATH_UNSTAGED}; \
		${MKDIR} $${DEST_COMPONENT_PATH}; \
		DASHBOARD_FIND_ARGS="-path */_meta/kibana -type d"; \
		DASHBOARD_PATHS=$$(${SETENV} ${FIND} ${WRKSRC}/${GO_TARGET} $${DASHBOARD_FIND_ARGS}); \
		for DASHBOARD_PATH in $${DASHBOARD_PATHS}; \
		do \
			(cd $${DASHBOARD_PATH} && ${COPYTREE_SHARE} . $${DEST_COMPONENT_PATH}); \
		done)
.endfor
.for BEATMOD in filebeat metricbeat
	${MKDIR} ${STAGEDIR}${ETCDIR}/${BEATMOD}.modules.d ${STAGEDIR}${DATADIR}/${BEATMOD}/module
	(cd ${WRKSRC}/${BEATMOD}/module && ${COPYTREE_SHARE} . ${STAGEDIR}${DATADIR}/${BEATMOD}/module ${FIND_ARGS})
	(cd ${WRKSRC}/${BEATMOD}/modules.d && ${COPYTREE_SHARE} . ${STAGEDIR}${ETCDIR}/${BEATMOD}.modules.d)
.endfor

.include <bsd.port.mk>
