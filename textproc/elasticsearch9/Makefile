PORTNAME=	elasticsearch
PORTVERSION=	9.4.1
PORTREVISION=	1
CATEGORIES=	textproc java devel
MASTER_SITES=	https://artifacts.elastic.co/downloads/${PORTNAME}/
PKGNAMESUFFIX=	9
DISTNAME=	${PORTNAME}-${PORTVERSION}-darwin-x86_64
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Distributed, RESTful search and analytics engine
WWW=		https://www.elastic.co/

LICENSE=	ELASTIC20
LICENSE_NAME=	Elastic License 2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	BSD native bindings use the amd64 ABI

LIB_DEPENDS=	libzstd.so:archivers/zstd
RUN_DEPENDS=	bash:shells/bash

USES=		cpe java shebangfix
JAVA_VERSION=	21
USE_GITHUB=	nodefault
GH_TUPLE=	elastic:elasticsearch:v${PORTVERSION}:source
USE_RC_SUBR=	${PORTNAME}

SHEBANG_FILES=	bin/elasticsearch bin/elasticsearch-certgen \
		bin/elasticsearch-certutil bin/elasticsearch-cli \
		bin/elasticsearch-create-enrollment-token \
		bin/elasticsearch-croneval bin/elasticsearch-env \
		bin/elasticsearch-env-from-file bin/elasticsearch-geoip \
		bin/elasticsearch-keystore bin/elasticsearch-node \
		bin/elasticsearch-plugin bin/elasticsearch-reconfigure-node \
		bin/elasticsearch-reset-password \
		bin/elasticsearch-saml-metadata \
		bin/elasticsearch-service-tokens \
		bin/elasticsearch-setup-passwords bin/elasticsearch-shard \
		bin/elasticsearch-sql-cli bin/elasticsearch-syskeygen \
		bin/elasticsearch-users

CONFLICTS=	elasticsearch6 elasticsearch7 elasticsearch8

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

CONFIG_FILES=	elasticsearch.yml jvm.options log4j2.properties \
		role_mapping.yml roles.yml
BINS=		elasticsearch elasticsearch-certgen elasticsearch-certutil \
		elasticsearch-cli elasticsearch-create-enrollment-token \
		elasticsearch-croneval elasticsearch-env \
		elasticsearch-env-from-file elasticsearch-geoip \
		elasticsearch-keystore elasticsearch-node elasticsearch-plugin \
		elasticsearch-reconfigure-node elasticsearch-reset-password \
		elasticsearch-saml-metadata elasticsearch-service-tokens \
		elasticsearch-setup-passwords elasticsearch-shard \
		elasticsearch-sql-cli elasticsearch-sql-cli-${PORTVERSION}.jar \
		elasticsearch-syskeygen elasticsearch-users

PORTDOCS=	LICENSE.txt NOTICE.txt README.asciidoc

SIGAR_ARCH=	${ARCH:S|i386|x86|}
SEARCHUSER?=	elasticsearch
SEARCHGROUP?=	${SEARCHUSER}
USERS=		${SEARCHUSER}
GROUPS=		${SEARCHGROUP}

PORTSCOUT=	limit:^9

SUB_FILES=	pkg-message
SUB_LIST=	ETCDIR=${ETCDIR} \
		LOCALBASE=${LOCALBASE} \
		JAVA_HOME=${JAVA_HOME} \
		BINDIR=${PREFIX}/bin

post-extract:
	${RM} -rf ${WRKSRC}/jdk.app
.for module in entitlement native
	${MKDIR} ${WRKSRC}/src/${module:S/entitlement/ent/}
	${TAR} -xf ${DISTDIR}/${DISTFILE_source} -C ${WRKSRC}/src \
		-C ${module:S/entitlement/ent/} --strip-components=6 \
		${PORTNAME}-${PORTVERSION}/libs/${module}/src/main/java
.endfor

post-patch:
	# Keep the ML module's settings and dependencies, but disable its native code.
	${RM} -rf ${WRKSRC}/modules/x-pack-ml/platform
	${REINPLACE_CMD} -e 's|%%JAVA_HOME%%|${JAVA_HOME}|g' ${WRKSRC}/bin/elasticsearch-env

do-build:
	${SETENV} JAVA_HOME=${JAVA_HOME} ${SH} ${FILESDIR}/build-bsd.sh \
		${WRKSRC} ${WRKDIR}/bsd-classes ${PORTVERSION}

do-test:
	${MKDIR} ${WRKDIR}/bsd-test-classes
	${CC} ${CFLAGS} -o ${WRKDIR}/posix-fallocate-probe ${FILESDIR}/PosixFallocateProbe.c
	${JAVAC} -J-XX:TieredStopAtLevel=1 -proc:none --release 21 \
		-classpath "${WRKSRC}/lib/*" -d ${WRKDIR}/bsd-test-classes \
		${FILESDIR}/BsdNativeTests.java
	${JAVA} --enable-native-access=ALL-UNNAMED -ea \
		-Des.nativelibs.path=${LOCALBASE}/lib \
		-classpath "${WRKDIR}/bsd-test-classes:${WRKSRC}/lib/*" BsdNativeTests \
		${WRKDIR}/posix-fallocate-probe

do-install:
	${INSTALL} -d -m 0750 ${PREFIX}/etc/elasticsearch
.for f in ${CONFIG_FILES}
	${INSTALL} ${WRKSRC}/config/${f} ${ETCDIR}/${f}.sample
.endfor
	${MKDIR} ${PREFIX}/lib/elasticsearch/bin
.for f in ${BINS}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/${f} ${PREFIX}/lib/elasticsearch/bin
	${RLN} ${PREFIX}/lib/elasticsearch/bin/${f} ${PREFIX}/bin/${f}
	${ECHO_CMD} "bin/${f}" >> ${TMPPLIST}
.endfor
	${MKDIR} ${PREFIX}/lib/elasticsearch/lib
	(cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${PREFIX}/lib/elasticsearch/lib/ "-name *\.jar")
	${MKDIR} ${PREFIX}/lib/elasticsearch/lib/platform/freebsd-x64
	${LN} -s ${LOCALBASE}/lib/libzstd.so.1 \
		${PREFIX}/lib/elasticsearch/lib/platform/freebsd-x64/libzstd.so
	${INSTALL_DATA} ${FILESDIR}/README.MidnightBSD ${PREFIX}/lib/elasticsearch/

	${MKDIR} ${PREFIX}/lib/elasticsearch/modules
	(cd ${WRKSRC}/modules && ${COPYTREE_SHARE} . ${PREFIX}/lib/elasticsearch/modules/)
	${MKDIR} ${PREFIX}/lib/elasticsearch/plugins
	${MKDIR} ${PREFIX}/libexec/elasticsearch
	${INSTALL} -lrs ${ETCDIR} ${PREFIX}/lib/elasticsearch/config
	${TOUCH} ${ETCDIR}/users.sample ${ETCDIR}/users_roles.sample
	${MKDIR} ${ETCDIR}/jvm.options.d

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${FAKE_DESTDIR}${DOCSDIR}
.endfor

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/elasticsearch.yml.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/log4j2.properties.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/jvm.options.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/roles.yml.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/role_mapping.yml.sample" >> ${TMPPLIST}
	${FIND} -s ${PREFIX}/lib/elasticsearch -not -type d | ${SORT} | \
		${SED} -e 's#^${PREFIX}/##' >> ${TMPPLIST}
	${ECHO} "@dir lib/elasticsearch/plugins" >> ${TMPPLIST}
	${ECHO} "@dir libexec/elasticsearch" >> ${TMPPLIST}
	${ECHO} "@dir(${SEARCHUSER},${SEARCHGROUP},0755) ${ETCDIR_REL}" >> ${TMPPLIST}
	${ECHO} "@dir(${SEARCHUSER},${SEARCHGROUP},0755) ${ETCDIR_REL}/jvm.options.d" >> ${TMPPLIST}
	${ECHO} "@owner ${SEARCHUSER}" >> ${TMPPLIST}
	${ECHO} "@group ${SEARCHGROUP}" >> ${TMPPLIST}
	${ECHO} "@mode 0640" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/users.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/users_roles.sample" >> ${TMPPLIST}
	${ECHO} "@mode" >> ${TMPPLIST}
	${ECHO} "@owner" >> ${TMPPLIST}
	${ECHO} "@group" >> ${TMPPLIST}

.include <bsd.port.mk>
