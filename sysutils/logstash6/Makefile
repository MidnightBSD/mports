PORTNAME=	logstash
PORTVERSION=	6.8.16
CATEGORIES=	sysutils java
MASTER_SITES=	http://artifacts.elastic.co/downloads/logstash/
PKGNAMESUFFIX=	6

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Server-side data ingestion and transformation tool

LICENSE=	apache2

RUN_DEPENDS=	${LOCALBASE}/bin/bash:shells/bash

USES=		cpe shebangfix

CPE_VENDOR=	elastic
USE_JAVA=	yes
JAVA_VERSION=	1.8+
JAVA_RUN=	yes
USE_RC_SUBR=	logstash
SHEBANG_FILES=	bin/*
CONFLICTS=	logstash logstash5* logstash7*

NO_BUILD=	yes
SUB_LIST=	JAVA_HOME=${JAVA_HOME} \
		LOGSTASH_HOME=${LOGSTASH_HOME}

USERS=		logstash
GROUPS=		logstash

LOGSTASH_CONF_FILES=		jvm.options log4j2.properties logstash.yml \
				pipelines.yml startup.options
LOGSTASH_DIR=	${PREFIX}/${PORTNAME}
LOGSTASH_HOME?=	${PREFIX}/${PORTNAME}
LOGSTASH_JRUBY_BIN_FILES=	ast gem irb jgem jirb jirb_swing jruby \
				jruby.bash jruby.sh jrubyc rake rdoc ri testrb
LOGSTASH_JRUBY_SUBDIR=		vendor/jruby/bin

post-patch:
	${REINPLACE_CMD} 's|%%ETCDIR%%|${ETCDIR}|g' ${WRKSRC}/config/logstash.yml
	${FIND} ${WRKSRC} -name '*.orig' -delete

do-install:
	${FIND} ${WRKSRC} -name '*.bat' -delete
	${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/logstash.conf.sample ${ETCDIR}
.for x in ${LOGSTASH_CONF_FILES}
	${INSTALL_DATA} ${WRKSRC}/config/${x} ${ETCDIR}/${x}.sample
.endfor
	${RM} -rf ${WRKSRC}/config
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${LOGSTASH_DIR})
	${CHMOD} ${BINMODE} ${LOGSTASH_DIR}/bin/*
.for x in ${LOGSTASH_JRUBY_BIN_FILES}
	${CHMOD} ${BINMODE} ${LOGSTASH_DIR}/${LOGSTASH_JRUBY_SUBDIR}/${x}
.endfor
	${INSTALL} -lrs ${ETCDIR} ${LOGSTASH_DIR}/config

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/logstash.conf.sample" >> ${TMPPLIST}
.for x in ${LOGSTASH_CONF_FILES}
	${ECHO} "@sample ${ETCDIR_REL}/${x}.sample" >> ${TMPPLIST}
.endfor
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/build_info
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/cache
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/doc
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/extensions
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/gems/manticore-0.6.4-java/spec/ssl
	${RM} -rf ${PREFIX}/logstash/vendor/bundle/jruby/2.5.0/gems/redis-3.3.5/test/db
	${RM} -rf ${PREFIX}/logstash/vendor/jruby/lib/ruby/gems/shared/cache
	${FIND} -s ${PREFIX}/logstash -not -type d | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir(logstash,logstash,) logstash/data" >> ${TMPPLIST}

.include <bsd.port.mk>
