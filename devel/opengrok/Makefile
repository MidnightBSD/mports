PORTNAME=	opengrok
PORTVERSION=	1.7.31
CATEGORIES=	devel java
MASTER_SITES=	https://github.com/oracle/opengrok/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and powerful code search and cross-reference engine
WWW=		https://opengrok.github.io/OpenGrok/

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
SUB_FILES=	opengrok pkg-message
SUB_LIST+=	JARFILE="${JARFILE}"
PLIST_SUB=	T=${WEBAPP_HOME:S|^${LOCALBASE}/||} \
		OWNER=${SHAREOWN} GROUP=${SHAREGRP}

OPTIONS_DEFINE=		DOCS
OPTIONS_SINGLE=		AS
OPTIONS_SINGLE_AS=	GLASSFISH TOMCAT10
OPTIONS_DEFAULT=	TOMCAT10

GLASSFISH_DESC?=	Glassfish support

GLASSFISH_VARS=	WEBAPP_HOME=${LOCALBASE}/glassfish-5.1.0/glassfish
TOMCAT10_VARS=	WEBAPP_HOME=${LOCALBASE}/apache-tomcat-10.0

GLASSFISH_BUILD_DEPENDS=${WEBAPP_HOME}/modules/glassfish.jar:www/glassfish
GLASSFISH_RUN_DEPENDS=	${WEBAPP_HOME}/modules/glassfish.jar:www/glassfish
TOMCAT10_BUILD_DEPENDS=	${WEBAPP_HOME}/bin/bootstrap.jar:www/tomcat10
TOMCAT10_RUN_DEPENDS=	${WEBAPP_HOME}/bin/bootstrap.jar:www/tomcat10

WEBAPPS_DIR=	${WEBAPP_HOME:S|^${LOCALBASE}/||}/webapps
JARFILE=	${LOCALBASE}/${WEBAPPS_DIR}/opengrok/WEB-INF/lib/opengrok-${PORTVERSION}.jar

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
	${INSTALL_DATA} ${WRKSRC}/doc/logging.properties ${STAGEDIR}${DATADIR}/etc/logging.properties.sample
	${INSTALL_SCRIPT} ${WRKDIR}/opengrok ${STAGEDIR}${PREFIX}/bin

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S,^,${WRKSRC}/doc/,} ${FAKE_DESTDIR}${DOCSDIR}/

.include <bsd.port.mk>
