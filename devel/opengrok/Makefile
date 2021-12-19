PORTNAME=	opengrok
PORTVERSION=	1.6.9
CATEGORIES=	devel java
MASTER_SITES=	https://github.com/oracle/opengrok/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and powerful code search and cross-reference engine

LICENSE=	cddl ADAIC bsd3 epl ECMA mit ruby
LICENSE_COMB=	multi
LICENSE_FILE_cddl=	${WRKSRC}/doc/LICENSE.txt
LICENSE_FILE_ADAIC=	${WRKSRC}/doc/LICENSE-adaic.org.txt
LICENSE_FILE_bsd3=	${WRKSRC}/doc/LICENSE-scala.txt
LICENSE_FILE_eplL=	${WRKSRC}/doc/LICENSE-eclipse.txt
LICENSE_FILE_ECMA=	${WRKSRC}/doc/LICENSE-ecma.txt
LICENSE_FILE_mit=	${WRKSRC}/doc/LICENSE-mandoc.txt
LICENSE_FILE_ruby=	${WRKSRC}/doc/LICENSE-ruby.txt
LICENSE_NAME_ADAIC=	Ada Reference Manual, ISO/IEC 8652:2007(E) Ed. 3
LICENSE_PERMS_ADAIC=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_NAME_ECMA=	Ecma International
LICENSE_PERMS_ECMA=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

RUN_DEPENDS=	uctags:devel/universal-ctags

USES=		cpe
CPE_VENDOR=	oracle
USE_JAVA=	11+
JAVA_VERSION=	11+
SHAREOWN=	www
SHAREGRP=	www
NO_BUILD=	yes
NO_ARCH=	yes
PORTDOCS=	README.md logging.properties.template
SUB_FILES=	opengrok
SUB_LIST+=	LIBFILES="${LIBFILES:S,^,${DATADIR}/lib/,}" \
		JARFILE="${JARFILE}"
PLIST_SUB=	T=${WEBAPP_HOME:S|^${LOCALBASE}/||} \
		OWNER=${SHAREOWN} GROUP=${SHAREGRP}

OPTIONS_DEFINE=		DOCS
OPTIONS_SINGLE=		AS

WEBAPP_HOME=${LOCALBASE}/apache-tomcat-10.0
BUILD_DEPENDS+=	${WEBAPP_HOME}/bin/bootstrap.jar:www/tomcat10
RUN_DEPENDS+=	${WEBAPP_HOME}/bin/bootstrap.jar:www/tomcat10

JARFILE=	${DATADIR}/opengrok.jar
LIBFILES=	org.eclipse.jgit-5.11.0.202103091610-r.jar \
slf4j-api-1.7.29.jar \
lucene-memory-8.8.0.jar \
commons-lang3-3.9.jar \
JavaEWAH-1.1.7.jar \
hk2-locator-3.0.1.jar \
javax.activation-api-1.2.0.jar \
lucene-join-8.8.0.jar \
osgi-resource-locator-1.0.3.jar \
hk2-utils-3.0.1.jar \
javassist-3.25.0-GA.jar \
jakarta.validation-api-3.0.0.jar \
commons-compress-1.19.jar \
classgraph-4.8.69.jar \
jaxb-api-2.3.1.jar \
jakarta.annotation-api-2.0.0.jar \
lucene-queryparser-8.8.0.jar \
micrometer-registry-statsd-1.5.4.jar \
jackson-databind-2.11.3.jar \
bcel-6.4.1.jar \
micrometer-registry-prometheus-1.5.4.jar \
simpleclient_common-0.8.1.jar \
opengrok.jar \
lucene-analyzers-common-8.8.0.jar \
ant-1.10.9.jar \
jackson-annotations-2.11.3.jar \
annotations-20.1.0.jar \
opengrok-1.6.9.jar \
HdrHistogram-2.1.12.jar \
jackson-module-jaxb-annotations-2.11.3.jar \
micrometer-core-1.5.4.jar \
lucene-highlighter-8.8.0.jar \
classmate-1.5.1.jar \
jakarta.inject-api-2.0.0.jar \
hibernate-validator-7.0.0.Final.jar \
webjars-locator-core-0.46.jar \
jakarta.activation-api-2.0.0.jar \
lucene-backward-codecs-8.8.0.jar \
jakarta.ws.rs-api-3.0.0.jar \
jakarta.el-api-4.0.0.jar \
cron-utils-9.1.3.jar \
org.suigeneris.jrcs.diff-0.4.2.jar \
org.suigeneris.jrcs.rcs-0.4.2.jar \
jaxb-impl-2.3.0.jar \
ant-launcher-1.10.9.jar \
jersey-server-3.0.1.jar \
jakarta.el-4.0.0.jar \
jersey-bean-validation-3.0.1.jar \
jersey-common-3.0.1.jar \
jackson-core-2.10.0.jar \
jersey-hk2-3.0.1.jar \
lucene-suggest-8.8.0.jar \
jersey-entity-filtering-3.0.1.jar \
jersey-media-json-jackson-3.0.1.jar \
lucene-sandbox-8.8.0.jar \
LatencyUtils-2.0.3.jar \
simpleclient-0.8.1.jar \
lucene-queries-8.8.0.jar \
jboss-logging-3.4.1.Final.jar \
jersey-client-3.0.1.jar \
jaxb-core-2.3.0.jar \
hk2-api-3.0.1.jar \
lucene-core-8.8.0.jar \
aopalliance-repackaged-3.0.1.jar



WEBAPPS_DIR=	${WEBAPP_HOME:S|^${LOCALBASE}/||}/webapps

post-extract:
	@${MKDIR} ${WRKSRC}/lib/opengrok
	@${TAR} -xf ${WRKSRC}/lib/source.war -C ${WRKSRC}/lib/opengrok

do-install:
	@${MKDIR} ${STAGEDIR}${DATADIR}/etc ${STAGEDIR}${DATADIR}/lib \
		${STAGEDIR}${PREFIX}/${WEBAPPS_DIR}/${PORTNAME} \
		${STAGEDIR}/var/log/opengrok
	(cd ${WRKSRC}/lib/opengrok && ${COPYTREE_SHARE} . \
		${STAGEDIR}${PREFIX}/${WEBAPPS_DIR}/${PORTNAME})
	(cd ${STAGEDIR}${PREFIX}/${WEBAPPS_DIR}/${PORTNAME}/WEB-INF && \
		${MV} web.xml web.xml.sample)
	${INSTALL_DATA} ${LIBFILES:S,^,${WRKSRC}/lib/,} \
		${STAGEDIR}${DATADIR}/lib/
	${INSTALL_DATA} ${WRKSRC}/lib/opengrok.jar ${STAGEDIR}${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/lib/source.war ${STAGEDIR}${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/doc/logging.properties ${STAGEDIR}${DATADIR}/etc/logging.properties.sample
	${INSTALL_SCRIPT} ${WRKDIR}/opengrok ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
