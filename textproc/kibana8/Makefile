PORTNAME=	kibana
DISTVERSION=	8.19.23
DISTVERSIONSUFFIX=	-linux-x86_64
CATEGORIES=	textproc www
MASTER_SITES=	https://artifacts.elastic.co/downloads/kibana/
PKGNAMESUFFIX=	8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Browser based analytics and search interface to Elasticsearch
WWW=		https://www.elastic.co/products/kibana

LICENSE=	Elastic-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

ONLY_FOR_ARCHS=	amd64
ONLY_FOR_ARCHS_REASON=	upstream distribution targets 64-bit x86

RUN_DEPENDS=	node24>=24.21.0:www/node24
# The isolated port checks can also run on an older host Node runtime.
TEST_DEPENDS=	node:www/node24

USES=		cpe nodejs:24,env
CPE_VENDOR=	elastic
USE_RC_SUBR=	${PORTNAME}

CONFLICTS=	kibana7
NO_BUILD=	yes
PORTSCOUT=	limit:^8

EXTRACT_AFTER_ARGS+=	--exclude '${PORTNAME}-${DISTVERSION}/node' \
	--exclude '*/@napi-rs/nice-linux-x64-gnu' \
	--exclude '*/chromium/headless_shell-linux_x64'

WWWDIR=		${PREFIX}/www/${PORTNAME}${PKGNAMESUFFIX}
WRKSRC=		${WRKDIR}/${PORTNAME}-${DISTVERSION}

SUB_FILES=	pkg-deinstall pkg-message
SUB_LIST+=	BINDIR=${PREFIX}/bin \
		PKGNAMESUFFIX=${PKGNAMESUFFIX} \
		PORTNAME=${PORTNAME}

BINS=		kibana-encryption-keys kibana-health-gateway kibana-keystore \
		kibana-plugin kibana-setup kibana-verification-code

post-patch:
	${REINPLACE_CMD} -e 's|%%WWWDIR%%|${WWWDIR}|g' ${WRKSRC}/config/kibana.yml

do-test:
	${LOCALBASE}/bin/node ${FILESDIR}/port-tests.cjs ${WRKSRC}

do-install:
	${MKDIR} ${WWWDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/config/kibana.yml ${ETCDIR}/kibana.yml.sample
	${INSTALL_DATA} ${WRKSRC}/config/node.options ${ETCDIR}/node.options.sample
	(cd ${WRKSRC} && ${COPYTREE_SHARE} . ${WWWDIR} "-not -regex ./config(/.*)? -and -not -name *.orig")
	(cd ${WRKSRC} && ${COPYTREE_BIN} bin ${WWWDIR})
	${INSTALL} -lrs ${ETCDIR} ${WWWDIR}/config
	${MKDIR} ${WWWDIR}/node/glibc-217/bin ${WWWDIR}/data \
		${WWWDIR}/plugins ${WWWDIR}/logs
	${LN} -s ${LOCALBASE}/bin/node ${WWWDIR}/node/glibc-217/bin/node
	${INSTALL_DATA} ${FILESDIR}/README.MidnightBSD ${WWWDIR}
.for f in ${BINS}
	${INSTALL} -lrs ${WWWDIR}/bin/${f} ${PREFIX}/bin/${f}
	${ECHO} "bin/${f}" >> ${TMPPLIST}
.endfor

post-install:
	${ECHO} "@sample ${ETCDIR_REL}/kibana.yml.sample" >> ${TMPPLIST}
	${ECHO} "@sample ${ETCDIR_REL}/node.options.sample" >> ${TMPPLIST}
	${FIND} -s ${WWWDIR} -not -type d | ${SORT} | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/##' >> ${TMPPLIST}
	${FIND} -s ${WWWDIR} -type d -empty -not -path ${WWWDIR}/data | \
		${SED} -e 's#^${FAKE_DESTDIR}${TRUE_PREFIX}/#@dir #' >> ${TMPPLIST}
	${ECHO} "@dir(www,www) ${WWWDIR_REL}/data" >> ${TMPPLIST}

.include <bsd.port.mk>
