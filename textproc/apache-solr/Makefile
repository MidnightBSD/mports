PORTNAME=	apache-solr
PORTVERSION=	9.8.0
PORTREVISION=	0
CATEGORIES=	textproc java
MASTER_SITES=	https://archive.apache.org/dist/solr/solr/${PORTVERSION}/
DISTNAME=	solr-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High performance search server built using Lucene Java
WWW=		https://lucene.apache.org/solr/

LICENSE=	apache2

RUN_DEPENDS=	bash:shells/bash

USES=		cpe java tar:tgz
CPE_VENDOR=	apache
CPE_PRODUCT=	solr
JAVA_VERSION=	11+
NO_BUILD=	yes
NO_ARCH=	yes
PLIST_SUB+=	PORTVERSION="${PORTVERSION}"
SUB_FILES=	pkg-message
USE_RC_SUBR=	solr
USERS=		solr
GROUPS=		${USERS}

CPE_PRODUCT=	solr
CPE_VENDOR=	apache

OPTIONS_DEFINE=	JTS
OPTIONS_SUB=	yes

JTS_DESC=	Enable support for JTS Topology Suite
JTS_RUN_DEPENDS=	jts>0:math/jts

do-install:
	${FIND} ${WRKSRC} -name '*.orig' -delete
	cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/post ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/postlogs ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/bin/solr ${STAGEDIR}${PREFIX}/${CPE_PRODUCT}/bin
	${INSTALL_DATA} ${WRKSRC}/bin/solr.in.sh ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} '' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} 'SOLR_HOME="/var/db/solr"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} '# LOG4J_PROPS="/var/db/solr/log4j2.xml"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} 'SOLR_LOGS_DIR="/var/log/solr"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} 'SOLR_PORT="8983"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} 'SOLR_PID_DIR="/var/db/solr"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample
	${ECHO} 'SOLR_OPTS="$$SOLR_OPTS -Djetty.host=localhost -Dlog4j2.formatMsgNoLookups=true"' >> ${STAGEDIR}${PREFIX}/etc/solr.in.sh.sample

	${MKDIR} ${FAKE_DESTDIR}/var/db/solr
	${MKDIR} ${FAKE_DESTDIR}/var/log/solr
	${INSTALL_DATA} ${WRKSRC}/server/solr/solr.xml ${FAKE_DESTDIR}/var/db/solr/solr.xml.sample

do-install-JTS-on:
	${LN} -sf ${JAVALIBDIR}/jts-core.jar ${FAKE_DESTDIR}${PREFIX}/${CPE_PRODUCT}/server/solr-webapp/webapp/WEB-INF/lib/

post-install:
	${FIND} -s ${STAGEDIR}${PREFIX}/${CPE_PRODUCT} -not -type d | ${SORT} | \
		${SED} -e 's#^${STAGEDIR}${PREFIX}/##' >> ${TMPPLIST}
	@${ECHO_CMD} "@dir(solr,solr) /var/db/solr" >> ${TMPPLIST}
	@${ECHO_CMD} "@dir(solr,solr) /var/log/solr" >> ${TMPPLIST}
	@${ECHO_CMD} "@sample etc/solr.in.sh.sample" >> ${TMPPLIST}
	@${ECHO_CMD} "@sample(solr,solr) /var/db/solr/solr.xml.sample" >> ${TMPPLIST}

.include <bsd.port.mk>
