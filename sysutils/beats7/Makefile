PORTNAME=	beats
DISTVERSIONPREFIX=	v
DISTVERSION=	7.17.29
CATEGORIES=	sysutils
PKGNAMESUFFIX?=	7

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Send logs, network, metrics and heartbeat to elasticsearch or logstash
WWW=		https://www.elastic.co/products/beats/

LICENSE=	Apache-2.0

BUILD_DEPENDS=	${LOCALBASE}/bin/mage:devel/mage

USES=		go:1.23,modules
USE_GITHUB=	yes

GH_ACCOUNT=	elastic
GO_MODULE=	github.com/elastic/beats/v7@v${DISTVERSION}
GO_MOD_DIST=	github
USE_RC_SUBR=	${GO_TARGETS}

GO_PKGNAME=	github.com/${GH_ACCOUNT}/${GH_PROJECT}
CGO_CFLAGS=	-I.
CGO_LDFLAGS=	-L.
MAKE_ENV+=	GOBUILD_FLAGS="-mod=vendor"

CONFLICTS=	beats6*

PORTSCOUT=	limit:^7

SUB_FILES=	pkg-message

NO_TEST=	yes

OPTIONS_DEFINE=		AUDITBEAT FILEBEAT HEARTBEAT METRICBEAT PACKETBEAT
OPTIONS_DEFAULT=	FILEBEAT HEARTBEAT METRICBEAT
OPTIONS_SUB=		yes

AUDITBEAT_DESC=			Auditbeat
FILEBEAT_DESC=			Filebeat
HEARTBEAT_DESC=			Heartbeat
METRICBEAT_DESC=		Metricbeat
PACKETBEAT_DESC=		Packetbeat
AUDITBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/auditbeat/:auditbeat
AUDITBEAT_DISTFILES=		auditbeat-${DISTVERSION}-darwin-x86_64.tar.gz:auditbeat
AUDITBEAT_VARS=			GO_TARGETS+=auditbeat
FILEBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/filebeat/:filebeat
FILEBEAT_DISTFILES=		filebeat-${DISTVERSION}-darwin-x86_64.tar.gz:filebeat
FILEBEAT_VARS=			GO_TARGETS+=filebeat
HEARTBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/heartbeat/:heartbeat
HEARTBEAT_DISTFILES=		heartbeat-${DISTVERSION}-darwin-x86_64.tar.gz:heartbeat
HEARTBEAT_VARS=			GO_TARGETS+=heartbeat
METRICBEAT_MASTER_SITES=	https://artifacts.elastic.co/downloads/beats/metricbeat/:metricbeat
METRICBEAT_DISTFILES=		metricbeat-${DISTVERSION}-darwin-x86_64.tar.gz:metricbeat
METRICBEAT_VARS=		GO_TARGETS+=metricbeat
PACKETBEAT_MASTER_SITES=	https://artifacts.elastic.co/downloads/beats/packetbeat/:packetbeat
PACKETBEAT_DISTFILES=		packetbeat-${DISTVERSION}-darwin-x86_64.tar.gz:packetbeat
PACKETBEAT_VARS=		CGO_CFLAGS+=-I/usr/include \
				CGO_LDFLAGS+=-L/usr/lib \
				GO_TARGETS+=packetbeat

.include <bsd.mport.options.mk>

post-patch:
	${REINPLACE_CMD} -e "s|%%BEATSVERSION%%|v${PORTVERSION}|g" ${WRKSRC}/dev-tools/mage/settings.go
.for BEATMOD in ${GO_TARGETS}
	for f in ${WRKSRC}/${BEATMOD}/${BEATMOD}.yml \
		${WRKSRC}/${BEATMOD}/${BEATMOD}.reference.yml; do \
		if [ -f "$$f" ] && ${GREP} -q "%%DATADIR%%" "$$f"; then \
			${REINPLACE_CMD} -e "s|%%DATADIR%%|${DATADIR}|g" "$$f"; \
		fi; \
	done
.endfor

do-build:
.for GO_TARGET in ${GO_TARGETS}
	(cd ${GO_WRKSRC}/${GO_TARGET}; ${SETENV} ${MAKE_ENV} ${GO_ENV} ${LOCALBASE}/bin/mage build)
.endfor

do-install:
	${MKDIR} ${ETCDIR}
.for BEATMOD in ${GO_TARGETS}
	${MKDIR} /var/db/beats/${BEATMOD}
	${INSTALL_PROGRAM} ${GO_WRKSRC}/${BEATMOD}/${BEATMOD} \
		${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/${BEATMOD}/${BEATMOD}.yml \
		${ETCDIR}/${BEATMOD}.yml.sample
	${INSTALL_DATA} ${WRKSRC}/${BEATMOD}/${BEATMOD}.reference.yml \
		${ETCDIR}/${BEATMOD}.yml.reference
.endfor
.for BEATMOD in ${GO_TARGETS}
	(MODULE_SRC=${WRKDIR}/${BEATMOD}-${DISTVERSION}-darwin-x86_64/module; \
	 if [ -d $${MODULE_SRC} ]; then \
	   MODULE_DEST=${DATADIR}/${BEATMOD}/module && \
	   ${MKDIR} $${MODULE_DEST} && \
	   cd $${MODULE_SRC} && ${COPYTREE_SHARE} . $${MODULE_DEST} && \
	   cd $${MODULE_DEST} && \
	   ${FIND} . -type d -empty | ${SORT} | \
	   ${SED} -e 's,^\.,@dir ${DATADIR_REL}/${BEATMOD}/module,' >> ${TMPPLIST} && \
	   ${FIND} . -not -type d | ${SORT} | \
	   ${SED} -e 's,^\.,${DATADIR_REL}/${BEATMOD}/module,' >> ${TMPPLIST}; \
	 fi)
	(MODULESD_SRC=${WRKDIR}/${BEATMOD}-${DISTVERSION}-darwin-x86_64/modules.d; \
	 if [ -d $${MODULESD_SRC} ]; then \
	   MODULESD_DEST=${EXAMPLESDIR}/${BEATMOD}.modules.d && \
	   ${MKDIR} $${MODULESD_DEST} && \
	   cd $${MODULESD_SRC} && ${COPYTREE_SHARE} . $${MODULESD_DEST} && \
	   cd $${MODULESD_DEST} && \
	   ${FIND} . -type d -empty | ${SORT} | \
	   ${SED} -e 's,^\.,@dir ${EXAMPLESDIR_REL}/${BEATMOD}.modules.d,' >> ${TMPPLIST} && \
	   ${FIND} . -not -type d | ${SORT} | \
	   ${SED} -e 's,^\.,${EXAMPLESDIR_REL}/${BEATMOD}.modules.d,' >> ${TMPPLIST}; \
	   ${MKDIR} ${ETCDIR}/${BEATMOD}.modules.d && \
	   ${ECHO_CMD} "The modules.d files are now in ${LOCALBASE}/${EXAMPLESDIR_REL}/${BEATMOD}.modules.d" > \
	     ${ETCDIR}/${BEATMOD}.modules.d/README; \
	   ${ECHO_CMD} ${ETCDIR_REL}/${BEATMOD}.modules.d/README >> ${TMPPLIST}; \
	 fi)
	(MONITORSD_SRC=${WRKDIR}/${BEATMOD}-${DISTVERSION}-darwin-x86_64/monitors.d; \
	 if [ -d $${MONITORSD_SRC} ]; then \
	   MONITORSD_DEST=${EXAMPLESDIR}/${BEATMOD}.monitors.d && \
	   ${MKDIR} $${MONITORSD_DEST} && \
	   cd $${MONITORSD_SRC} && ${COPYTREE_SHARE} . $${MONITORSD_DEST} && \
	   cd $${MONITORSD_DEST} && \
	   ${FIND} . -type d -empty | ${SORT} | \
	   ${SED} -e 's,^\.,@dir ${EXAMPLESDIR_REL}/${BEATMOD}.monitors.d,' >> ${TMPPLIST} && \
	   ${FIND} . -not -type d | ${SORT} | \
	   ${SED} -e 's,^\.,${EXAMPLESDIR_REL}/${BEATMOD}.monitors.d,' >> ${TMPPLIST}; \
	   ${MKDIR} ${ETCDIR}/${BEATMOD}.monitors.d && \
	   ${ECHO_CMD} "The monitors.d files are now in ${LOCALBASE}/${EXAMPLESDIR_REL}/${BEATMOD}.monitors.d" > \
	     ${ETCDIR}/${BEATMOD}.monitors.d/README; \
	   ${ECHO_CMD} ${ETCDIR_REL}/${BEATMOD}.monitors.d/README >> ${TMPPLIST}; \
	 fi)
	(KIBANA_SRC=${WRKDIR}/${BEATMOD}-${DISTVERSION}-darwin-x86_64/kibana; \
	 if [ -d $${KIBANA_SRC} ]; then \
	   KIBANA_PATH=${DATADIR}/${BEATMOD}/kibana; \
	   ${MKDIR} $${KIBANA_PATH} && \
	   cd $${KIBANA_SRC} && ${COPYTREE_SHARE} . $${KIBANA_PATH}; \
	   cd $${KIBANA_PATH} && \
	   ${FIND} . -type d -empty | ${SORT} | \
	   ${SED} -e 's,^\.,@dir ${DATADIR_REL}/${BEATMOD}/kibana,' >> ${TMPPLIST}; \
	   ${FIND} . -not -type d | ${SORT} | \
	   ${SED} -e 's,^\.,${DATADIR_REL}/${BEATMOD}/kibana,' >> ${TMPPLIST}; \
	 fi)
.endfor

.include <bsd.port.mk>
