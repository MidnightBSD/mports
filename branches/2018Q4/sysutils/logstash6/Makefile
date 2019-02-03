# Created by: Daniel Solsona <daniel@ish.com.au>, Guido Falsi <madpilot@FreeBSD.org>
# $FreeBSD: head/sysutils/logstash6/Makefile 469572 2018-05-10 19:15:44Z feld $

PORTNAME=	logstash
PORTVERSION=	6.2.4
PORTREVISION=	0
CATEGORIES=	sysutils java
MASTER_SITES=	http://artifacts.elastic.co/downloads/logstash/
PKGNAMESUFFIX=	6

MAINTAINER=	elastic@FreeBSD.org
COMMENT=	Server-side data ingest and transfomation tool

LICENSE=	apache2

RUN_DEPENDS=	${LOCALBASE}/bin/bash:shells/bash

CONFLICTS=	logstash-[0-9]* logstash5-[0-9]*

USES=		cpe shebangfix
SHEBANG_FILES=	bin/*
CPE_VENDOR=	elasticsearch
USE_JAVA=	yes
JAVA_VERSION=	1.8+
JAVA_RUN=	yes
NO_BUILD=	yes

USERS=	logstash
GROUPS=	logstash

LOGSTASH_DIR=	${PREFIX}/${PORTNAME}

USE_RC_SUBR=	logstash

LOGSTASH_HOME?=	${PREFIX}/${PORTNAME}

SUB_LIST=	JAVA_HOME=${JAVA_HOME} \
		LOGSTASH_HOME=${LOGSTASH_HOME}

LOGSTASH_CONF_FILES=	jvm.options log4j2.properties logstash.yml pipelines.yml
LOGSTASH_JRUBY_SUBDIR=	vendor/jruby/bin
LOGSTASH_JRUBY_BIN_FILES=	ast irb jirb jruby jruby.sh rdoc testrb gem \
				jgem jirb_swing jruby.bash jrubyc rake ri

post-patch:
	${REINPLACE_CMD} 's|%%ETCDIR%%|${ETCDIR}|g' ${WRKSRC}/config/logstash.yml
	${FIND} ${WRKSRC} -name '*.orig' -delete

do-install:
	${FIND} ${WRKSRC} -name '*.bat' -delete
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/etc/logstash
	${INSTALL_DATA} ${FILESDIR}/logstash.conf.sample ${ETCDIR}
.for x in ${LOGSTASH_CONF_FILES}
	${INSTALL_DATA} ${WRKSRC}/config/${x} ${ETCDIR}/${x}.sample
.endfor
	${RM} -rf ${WRKSRC}/config
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${STAGEDIR}${LOGSTASH_DIR})
	${CHMOD} ${BINMODE} ${STAGEDIR}${LOGSTASH_DIR}/bin/*
.for x in ${LOGSTASH_JRUBY_BIN_FILES}
	${CHMOD} ${BINMODE} ${STAGEDIR}${LOGSTASH_DIR}/${LOGSTASH_JRUBY_SUBDIR}/${x}
.endfor
	${INSTALL} -lrs ${STAGEDIR}${ETCDIR} ${STAGEDIR}${LOGSTASH_DIR}/config

post-install:
	${ECHO} "@sample etc/logstash/logstash.conf.sample" >> ${TMPPLIST}
.for x in ${LOGSTASH_CONF_FILES}
	${ECHO} "@sample etc/logstash/${x}.sample" >> ${TMPPLIST}
.endfor
	${FIND} -s ${FAKE_DESTDIR}${TRUE_PREFIX}/logstash -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir(logstash,logstash,) logstash/data" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/build_info" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/cache" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/doc" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/extensions" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/gems/manticore-0.6.1-java/spec/ssl" >> ${TMPPLIST}
	${ECHO} "@dir logstash/vendor/bundle/jruby/2.3.0/gems/redis-3.3.5/test/db" >> ${TMPPLIST}

.include <bsd.port.mk>
