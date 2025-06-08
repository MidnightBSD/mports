PORTNAME=	redis
DISTVERSION=	6.2.188888888
CATEGORIES=	databases
MASTER_SITES=	https://download.redis.io/releases/
PKGNAMESUFFIX=	62

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistent key-value database with built-in net interface
WWW=		https://redis.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

USES+=		compiler:c11 cpe gmake
CPE_VENDOR=	redislabs
CPE_PRODUCT=	redis
USE_RC_SUBR=	redis sentinel

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

CONFLICTS_INSTALL=	redis redis-devel redis6 redis72 redis74 # etc/rc.d/redis

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
