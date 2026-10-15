PORTNAME=	beats
DISTVERSIONPREFIX=	v
DISTVERSION=	9.4.0
CATEGORIES=	sysutils
MASTER_SITES=	https://raw.githubusercontent.com/${GH_ACCOUNT}/${GH_PROJECT}/${DISTVERSIONFULL}/:gomod
PKGNAMESUFFIX=	9
DISTFILES=	go.mod:gomod

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Send logs, metrics, and heartbeat data to Elasticsearch
WWW=		https://www.elastic.co/products/beats/

LICENSE=	Apache-2.0

USES=		go:1.25+,modules
USE_GITHUB=	yes

GH_ACCOUNT=	elastic

USE_RC_SUBR=	${GO_TARGET:S,./,,g}

GO_MODULE=	github.com/elastic/beats/v7
CGO_CFLAGS=	-I.
CGO_LDFLAGS=	-L.
MAKE_ENV+=	GOBUILD_FLAGS="-mod=vendor"

CONFLICTS=	${PORTNAME}*

PORTSCOUT=	limit:^${DISTVERSION:R:S|.|\.|}\.

SUB_FILES=	pkg-message

OPTIONS_DEFAULT=	FILEBEAT HEARTBEAT METRICBEAT
OPTIONS_MULTI=		BEATS
OPTIONS_MULTI_BEATS=	AUDITBEAT FILEBEAT HEARTBEAT METRICBEAT PACKETBEAT
OPTIONS_SUB=		yes

AUDITBEAT_DESC=			Auditbeat
BEATS_DESC=			Beats modules
FILEBEAT_DESC=			Filebeat
HEARTBEAT_DESC=			Heartbeat
METRICBEAT_DESC=		Metricbeat
PACKETBEAT_DESC=		Packetbeat
AUDITBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/auditbeat/:auditbeat
AUDITBEAT_DISTFILES=		auditbeat-${DISTVERSION}-darwin-x86_64.tar.gz:auditbeat
AUDITBEAT_VARS=			GO_TARGET+=./auditbeat
FILEBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/filebeat/:filebeat
FILEBEAT_DISTFILES=		filebeat-${DISTVERSION}-darwin-x86_64.tar.gz:filebeat
FILEBEAT_VARS=			GO_TARGET+=./filebeat
HEARTBEAT_MASTER_SITES=		https://artifacts.elastic.co/downloads/beats/heartbeat/:heartbeat
HEARTBEAT_DISTFILES=		heartbeat-${DISTVERSION}-darwin-x86_64.tar.gz:heartbeat
HEARTBEAT_VARS=			GO_TARGET+=./heartbeat
METRICBEAT_MASTER_SITES=	https://artifacts.elastic.co/downloads/beats/metricbeat/:metricbeat
METRICBEAT_DISTFILES=		metricbeat-${DISTVERSION}-darwin-x86_64.tar.gz:metricbeat
METRICBEAT_VARS=		GO_TARGET+=./metricbeat
PACKETBEAT_MASTER_SITES=	https://artifacts.elastic.co/downloads/beats/packetbeat/:packetbeat
PACKETBEAT_DISTFILES=		packetbeat-${DISTVERSION}-darwin-x86_64.tar.gz:packetbeat
PACKETBEAT_VARS=		CGO_CFLAGS+=-I/usr/include \
				CGO_LDFLAGS+=-L/usr/lib \
				GO_TARGET+=./packetbeat

.include <bsd.mport.options.mk>

.ifmake makesum || makeplist || distclean
.  for O in ${OPTIONS_MULTI_BEATS}
.    if !${PORT_OPTIONS:M${O}}
MASTER_SITES+=	${${O}_MASTER_SITES}
DISTFILES+=	${${O}_DISTFILES}
.    endif
.  endfor
.endif

post-patch:
	${REINPLACE_CMD} -e "s|%%BEATSVERSION%%|v${DISTVERSION}|g" ${WRKSRC}/dev-tools/mage/settings.go
.for BEATMOD in ${GO_TARGET:S,^./,,g}
	${REINPLACE_CMD} -e "s|%%DATADIR%%|${DATADIR}|g" ${WRKSRC}/${BEATMOD}/*.yml
.endfor

do-install:
	${MKDIR} ${ETCDIR}
.for BEATMOD in ${GO_TARGET:S,^./,,g}
	(${MKDIR} /var/db/beats/${BEATMOD} && \
	${INSTALL_PROGRAM} ${WRKDIR}/bin/${BEATMOD} \
		${PREFIX}/sbin && \
	${INSTALL_DATA} ${WRKSRC}/${BEATMOD}/${BEATMOD}.yml \
		${ETCDIR}/${BEATMOD}.yml.sample && \
	${INSTALL_DATA} ${WRKSRC}/${BEATMOD}/${BEATMOD}.reference.yml \
		${ETCDIR}/${BEATMOD}.yml.reference)
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
	 fi) && \
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
	   ${ECHO_CMD} "The modules.d files are now in ${TRUE_PREFIX}/${EXAMPLESDIR_REL}/${BEATMOD}.modules.d" > \
	     ${ETCDIR}/${BEATMOD}.modules.d/README; \
	   ${ECHO_CMD} ${ETCDIR_REL}/${BEATMOD}.modules.d/README >> ${TMPPLIST}; \
	 fi) && \
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
	   ${ECHO_CMD} "The monitors.d files are now in ${TRUE_PREFIX}/${EXAMPLESDIR_REL}/${BEATMOD}.monitors.d" > \
	     ${ETCDIR}/${BEATMOD}.monitors.d/README; \
	   ${ECHO_CMD} ${ETCDIR_REL}/${BEATMOD}.monitors.d/README >> ${TMPPLIST}; \
	 fi) && \
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
