PORTNAME=	logstash
PORTVERSION=	8.11.3
DISTVERSIONSUFFIX=	-darwin-x86_64
CATEGORIES=	sysutils java
MASTER_SITES=	https://artifacts.elastic.co/downloads/logstash/
PKGNAMESUFFIX=	8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Server-side data ingestion and transformation tool (8.x version)
WWW=		https://www.elastic.co/products/logstash

LICENSE=	Apache-2.0

ONLY_FOR_ARCHS=	aarch64 amd64

RUN_DEPENDS=	${LOCALBASE}/bin/bash:shells/bash

USES=		cpe java shebangfix
CPE_VENDOR=	elastic
JAVA_VERSION=	17+
USE_RC_SUBR=	logstash

SHEBANG_FILES=	bin/*

CONFLICTS=	logstash6 logstash7

NO_BUILD=	yes

PORTSCOUT=	limit:^8

SUB_FILES=	pkg-message
SUB_LIST=	JAVA_HOME=${JAVA_HOME} \
		LOGSTASH_HOME=${LOGSTASH_HOME}

WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

USERS=		logstash
GROUPS=		logstash

LOGSTASH_CONF_FILES=		jvm.options log4j2.properties logstash.yml \
				pipelines.yml startup.options
LOGSTASH_HOME?=			${PREFIX}/${PORTNAME}
LOGSTASH_JRUBY_BIN_FILES=	ast gem irb jgem jirb jirb_swing jruby \
				jruby.sh jrubyc rake rdoc ri
LOGSTASH_JRUBY_SUBDIR=		vendor/jruby/bin

post-extract:
	${RM} -rf ${WRKSRC}/jdk.app

post-patch:
	${REINPLACE_CMD} 's|%%ETCDIR%%|${ETCDIR}|g' ${WRKSRC}/config/logstash.yml
	${FIND} ${WRKSRC} -name '*.orig' -delete

do-install:
	${FIND} ${WRKSRC} -name '*.bat' -delete
	${MKDIR} ${STAGEDIR}${ETCDIR}
	${INSTALL_DATA} ${FILESDIR}/logstash.conf.sample ${STAGEDIR}${ETCDIR}
.for x in ${LOGSTASH_CONF_FILES}
	${INSTALL_DATA} ${WRKSRC}/config/${x} ${STAGEDIR}${ETCDIR}/${x}.sample
.endfor
	${RM} -rf ${WRKSRC}/config
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${LOGSTASH_HOME})
	${CHMOD} ${BINMODE} ${STAGEDIR}${LOGSTASH_HOME}/bin/*
.for x in ${LOGSTASH_JRUBY_BIN_FILES}
	${CHMOD} ${BINMODE} ${STAGEDIR}${LOGSTASH_HOME}/${LOGSTASH_JRUBY_SUBDIR}/${x}
.endfor
	${FIND} ${STAGEDIR}${LOGSTASH_HOME}/vendor/bundle/jruby/3.1.0/gems \
	        ${STAGEDIR}${LOGSTASH_HOME}/vendor/bundle/jruby/3.1.0/plugins \
		${STAGEDIR}${LOGSTASH_HOME}/vendor/jruby/lib/ruby/gems/shared/gems \
		-type d -empty -delete
	${INSTALL} -lrs ${STAGEDIR}${ETCDIR} ${STAGEDIR}${LOGSTASH_HOME}/config
	${RM} -rf ${STAGEDIR}${LOGSTASH_HOME}/vendor/jruby/lib/jni
	${RM} -rf ${STAGEDIR}${LOGSTASH_HOME}/vendor/jruby/tmp
	${MKDIR} ${STAGEDIR}${LOGSTASH_HOME}/vendor/jruby/lib/jni
	(cd ${WRKSRC}/vendor/jruby/tmp/lib/jni && \
	 ${COPYTREE_SHARE} ${ARCH:S/amd64/x86_64/}-FreeBSD \
	 ${STAGEDIR}${LOGSTASH_HOME}/vendor/jruby/lib/jni)

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/logstash.conf.sample" >> ${TMPPLIST}
.for x in ${LOGSTASH_CONF_FILES}
	${ECHO} "@sample ${ETCDIR_REL}/${x}.sample" >> ${TMPPLIST}
.endfor
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/build_info" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/cache" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/doc" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/3.1.0/extensions" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/jruby/lib/ruby/gems/shared/cache" >> ${TMPPLIST}
	${FIND} -s ${STAGEDIR}${LOGSTASH_HOME} -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir(logstash,logstash,) logstash/data" >> ${TMPPLIST}

.include <bsd.port.mk>
