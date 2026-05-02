PORTNAME=	openfire
DISTVERSIONPREFIX=	v
DISTVERSION=	4.9.2
PORTEPOCH=	1
CATEGORIES=	net-im java

MASTER_SITES=	FREEBSD_LOCAL/fernape:maven

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enterprise instant messaging server
WWW=		https://www.igniterealtime.org/projects/openfire/index.jsp

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	mvn:java/maven

USES=		java cpe
CPE_VENDOR=	igniterealtime
USE_GITHUB=	YES
GH_ACCOUNT=	igniterealtime
GH_PROJECT=	Openfire

USE_RC_SUBR=	${PORTNAME}
DATADIR=	${JAVASHAREDIR}/${PORTNAME}
NO_ARCH=	yes
SUB_FILES+=	pkg-message
SUB_LIST=	JAVA_VERSION=${JAVA_VERSION}

INSTALL_WRKSRC=	${WRKSRC}/distribution/target/distribution-base/
VARLOG=		/var/log/${PORTNAME}
VARDB=		/var/db/${PORTNAME}
USERS=		${PORTNAME}
GROUPS=		${USERS}
PLIST_SUB+=	VARDB=${VARDB} \
		VARLOG=${VARLOG}

OPTIONS_DEFINE=		DOCS TEST
OPTIONS_DEFAULT=	MAVEN_LOCAL OPENJDK11
OPTIONS_SINGLE=		JAVA MAVEN
OPTIONS_SINGLE_JAVA=	OPENJDK11 OPENJDK17 OPENJDK21
OPTIONS_SINGLE_MAVEN=	MAVEN_LOCAL MAVEN_ONLINE

MAVEN_DESC=		Source of Maven build plugins
MAVEN_LOCAL_DESC=	Use prefetch plugins from FreeBSD repository
MAVEN_ONLINE_DESC=	Download last plugins during build process and store them into ~/.m2

MAVEN_LOCAL_DISTFILES=	${PORTNAME}-${DISTVERSION}-deps${EXTRACT_SUFX}:maven

MVN=		mvn
MVN_TARGET=	package

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENJDK11}
JAVA_VERSION=	11
.elif ${PORT_OPTIONS:MOPENJDK17}
JAVA_VERSION=	17
.elif ${PORT_OPTIONS:MOPENJDK21}
JAVA_VERSION=	21
.endif

.if ${PORT_OPTIONS:MTEST}
MVN_OPTS=	-DskipTests=false
.else
MVN_OPTS=	-DskipTests=true
.endif

.if ${PORT_OPTIONS:MMAVEN_LOCAL}
MVN_OPTS+=	-o -Dmaven.repo.local=${WRKDIR}/m2
.elif ${PORT_OPTIONS:MMAVEN_ONLINE}
MVN_OPTS+=	-U
.endif

do-build:
	@(cd ${WRKSRC} && JAVA_VERSION=${JAVA_VERSION} ${MVN} ${MVN_OPTS} ${MVN_TARGET})

do-install:
	@${MKDIR} ${DATADIR}/lib
	@${MKDIR} ${ETCDIR}
	@${MKDIR} ${VARDB}
	@${MKDIR} ${VARLOG}

	(cd ${INSTALL_WRKSRC}/lib && ${INSTALL} -m 744 *.jar ${DATADIR}/lib)
	(cd ${INSTALL_WRKSRC}/lib && ${INSTALL} -m 744 log4j2.xml ${DATADIR}/lib)

	(cd ${INSTALL_WRKSRC}/resources && \
	    ${FIND} . \! -path ./security\* \! -path ./nativeAuth\* | \
	    ${CPIO} -pvdmu -R ${SHAREOWN}:${SHAREGRP} \
	        ${DATADIR}/resources)

	(cd ${INSTALL_WRKSRC}/plugins/admin && ${FIND} . \
	| ${CPIO} -pvdmu -R ${SHAREOWN}:${SHAREGRP} ${DATADIR}/plugins/admin)

	${LN} -sf ${ETCDIR} ${DATADIR}/conf
	${LN} -sf ${ETCDIR} ${DATADIR}/resources/security
	${LN} -sf ${VARDB} ${DATADIR}/embedded-db
	${LN} -sf ${VARLOG} ${DATADIR}/logs
	${INSTALL_DATA} ${INSTALL_WRKSRC}/conf/${PORTNAME}.xml \
		${ETCDIR}/${PORTNAME}.xml.sample
	${INSTALL_DATA} ${INSTALL_WRKSRC}/conf/security.xml \
		${ETCDIR}/security.xml.sample
	${INSTALL_DATA} ${INSTALL_WRKSRC}/conf/crowd.properties \
		${ETCDIR}/crowd.properties.sample
	${INSTALL} -m 600 ${INSTALL_WRKSRC}/resources/security/truststore \
		${ETCDIR}/truststore.sample
	${INSTALL} -m 600 ${INSTALL_WRKSRC}/resources/security/keystore \
		${ETCDIR}/keystore.sample

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${INSTALL_WRKSRC}/documentation && ${FIND} . \
	| ${CPIO} -pdmu -R ${SHAREOWN}:${SHAREGRP} ${FAKE_DESTDIR}${DOCSDIR} > /dev/null 2>&1 )

.include <bsd.port.mk>
