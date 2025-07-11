PORTNAME=	zookeeper
PORTVERSION=	3.8.4
CATEGORIES=	devel java
MASTER_SITES=	APACHE/${PORTNAME}/${PORTNAME}-${PORTVERSION} \
		APACHE/logging/log4j/${ZOOKEEPER_LOG4J2_VERSION}/:log4j2
DISTNAME=	apache-${PORTNAME}-${PORTVERSION}-bin
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Coordination Service for Distributed Applications
WWW=		https://zookeeper.apache.org/

LICENSE=	Apache-2.0

RUN_DEPENDS=	libzookeeper>=${PORTVERSION}:devel/libzookeeper

USES=		cpe java
CPE_VENDOR=	apache
USE_RC_SUBR=	zookeeper

DATADIR=	${JAVASHAREDIR}/${PORTNAME}
NO_ARCH=	yes
NO_BUILD=	yes
SUB_FILES=	zkCli.sh
SUB_LIST=	JAVA=${JAVA} \
		ZOOKEEPER_GROUP=${ZOOKEEPER_GROUP} \
		ZOOKEEPER_LOGDIR=${ZOOKEEPER_LOGDIR} \
		ZOOKEEPER_USER=${ZOOKEEPER_USER}

ZOOKEEPER_CONFS=		configuration.xsl zoo.cfg
ZOOKEEPER_USER?=		zookeeper
ZOOKEEPER_GROUP?=		zookeeper
ZOOKEEPER_DBDIR?=		/var/db/zookeeper
ZOOKEEPER_LOGDIR?=		/var/log/zookeeper
ZOOKEEPER_LOG4J2_VERSION?=	2.22.0

USERS=		${ZOOKEEPER_USER}
GROUPS=		${ZOOKEEPER_GROUP}

PLIST_SUB=	PORTVERSION=${PORTVERSION} \
		ZOOKEEPER_DBDIR=${ZOOKEEPER_DBDIR} \
		ZOOKEEPER_GROUP=${ZOOKEEPER_GROUP} \
		ZOOKEEPER_LOGDIR=${ZOOKEEPER_LOGDIR} \
		ZOOKEEPER_USER=${ZOOKEEPER_USER}
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS LOG4J2
OPTIONS_SUB=	yes

LOG4J2_DESC=		Use log4j-2 instead Logback
LOG4J2_DISTFILES=	apache-log4j-${ZOOKEEPER_LOG4J2_VERSION}-bin${EXTRACT_SUFX}:log4j2
LOG4J2_PLIST_SUB=	ZOOKEEPER_LOG4J2_VERSION=${ZOOKEEPER_LOG4J2_VERSION}
LOG4J2_JARS=		log4j-api-${ZOOKEEPER_LOG4J2_VERSION}.jar \
			log4j-core-${ZOOKEEPER_LOG4J2_VERSION}.jar \
			log4j-slf4j-impl-${ZOOKEEPER_LOG4J2_VERSION}.jar

post-extract:
	@${REINPLACE_CMD} "/dataDir/s|=.*|=${ZOOKEEPER_DBDIR}|" ${WRKDIR}/${DISTNAME}/conf/zoo_sample.cfg
	@${MV} ${WRKDIR}/${DISTNAME}/conf/zoo_sample.cfg ${WRKDIR}/${DISTNAME}/conf/zoo.cfg

do-install:
	@${MKDIR} ${ETCDIR}
.for f in ${ZOOKEEPER_CONFS}
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/conf/${f} ${ETCDIR}/${f}.sample
.endfor
	@${MKDIR} ${DATADIR}
	(cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${DATADIR} "-name *\.jar")
	${INSTALL_SCRIPT} ${WRKDIR}/zkCli.sh ${PREFIX}/bin/
	${MKDIR} ${ZOOKEEPER_LOGDIR}
	${MKDIR} ${ZOOKEEPER_DBDIR}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	@(cd ${WRKDIR}/${DISTNAME}/docs && \
	${TAR} -cf - . | ${TAR} -xf - -C ${FAKE_DESTDIR}${DOCSDIR})

do-install-LOG4J2-on:
	${RM} ${FAKE_DESTDIR}${DATADIR}/logback-*
.for f in ${LOG4J2_JARS}
	${INSTALL_DATA} ${WRKDIR}/apache-log4j-${ZOOKEEPER_LOG4J2_VERSION}-bin/${f} ${FAKE_DESTDIR}${DATADIR}/
.endfor
	${INSTALL_DATA} ${FILESDIR}/log4j2.properties ${FAKE_DESTDIR}${ETCDIR}/log4j2.properties.sample

do-install-LOG4J2-off:
	${INSTALL_DATA} ${WRKDIR}/${DISTNAME}/conf/logback.xml ${FAKE_DESTDIR}${ETCDIR}/logback.xml.sample

.include <bsd.port.mk>
