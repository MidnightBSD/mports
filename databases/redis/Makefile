PORTNAME=	redis
DISTVERSION=	7.4.1
CATEGORIES=	databases
MASTER_SITES=	https://download.redis.io/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistent key-value database with built-in net interface
WWW=		https://redis.io/

LICENSE=        RSALv2 SSPLv1
LICENSE_COMB=   dual
LICENSE_NAME_RSALv2=    Redis Source Available License v2
LICENSE_NAME_SSPLv1=    Server Side Public License v1
LICENSE_FILE=   ${WRKSRC}/LICENSE.txt
LICENSE_PERMS_RSALv2=   dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_SSPLv1=   dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES+=		compiler:c11 cpe gmake
CPE_VENDOR=	redislabs
USE_RC_SUBR=	redis sentinel

CONFLICTS_INSTALL=    redis-devel redis6 # etc/rc.d/redis

OPTIONS_DEFINE=	JEMALLOC TESTS TLS
OPTIONS_SUB=	yes
JEMALLOC_DESC=	Use jemalloc
TLS_DESC=	Use TLS (openssl req.)
TESTS_DESC=	Install lang/tcl for redis unit tests

MAKE_ENV=	V=yo OPTIMIZATION=

JEMALLOC_MAKE_ENV=	USE_JEMALLOC=yes

TESTS_USES=	tcl:build

TLS_USES=	ssl
TLS_MAKE_ENV=	BUILD_TLS=yes

.include <bsd.port.pre.mk>

.if ${ARCH} == i386 && ! ${CFLAGS:M-march=*}
# Needed for __atomic_fetch_add_8
USE_GCC=	yes
CFLAGS+=	-march=i586
.endif

.if defined(_addflags)
CFLAGS=		-fPIC
LDFLAGS=	-Wl,-E
.endif

.if defined(MAGUS)
NO_TEST=	yes
.endif

LDFLAGS+=	-lpthread -lm -lexecinfo

CONFLICTS_INSTALL=	redis-devel redis6 redis62 redis70 # etc/rc.d/redis

USE_RC_SUBR=	redis sentinel
BIN_FILES=	redis-benchmark redis-check-aof redis-check-rdb \
		redis-cli redis-sentinel redis-server

USERS=	redis
GROUPS=	redis

REDIS_DBDIR?=	/var/db/redis
REDIS_RUNDIR?=	/var/run/redis
REDIS_LOGDIR?=	/var/log/redis

SUB_FILES=	pkg-message
SUB_LIST+=	PORTNAME=${PORTNAME} \
	REDIS_USER=${USERS} \
	REDIS_DBDIR=${REDIS_DBDIR} \
	REDIS_LOGDIR=${REDIS_LOGDIR} \
	REDIS_RUNDIR=${REDIS_RUNDIR}

PLIST_SUB+=	REDIS_USER=${USERS} \
	REDIS_GROUP=${GROUPS} \
	REDIS_LOGDIR=${REDIS_LOGDIR} \
	REDIS_DBDIR=${REDIS_DBDIR} \
	REDIS_RUNDIR=${REDIS_RUNDIR}

post-patch-JEMALLOC-on:
	@${REINPLACE_CMD} '35s!Linux!MidnightBSD!g' ${WRKSRC}/src/Makefile

post-build:
	${SED} ${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/redis.conf > ${WRKDIR}/redis.conf

do-install:
	${INSTALL_PROGRAM} ${BIN_FILES:C!^!${WRKSRC}/src/!} ${STAGEDIR}${PREFIX}/bin/
	${INSTALL_DATA} ${WRKDIR}/redis.conf ${STAGEDIR}${PREFIX}/etc/redis.conf.sample
	${INSTALL_DATA} ${WRKSRC}/sentinel.conf ${STAGEDIR}${PREFIX}/etc/sentinel.conf.sample
	${MKDIR} ${STAGEDIR}${REDIS_LOGDIR} \
		${STAGEDIR}${REDIS_DBDIR} \
		${STAGEDIR}${REDIS_RUNDIR}

do-test:
	@cd ${WRKSRC} && ${TCLSH} tests/test_helper.tcl

.include <bsd.port.post.mk>
