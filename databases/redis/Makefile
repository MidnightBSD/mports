PORTNAME=	redis
DISTVERSION=	8.8.0
CATEGORIES=	databases
MASTER_SITES=	https://download.redis.io/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistent key-value database with built-in net interface
WWW=		https://redis.io/

LICENSE=	AGPLv3 RSALv2 SSPLv1
LICENSE_COMB=	dual
LICENSE_NAME_AGPLv3=	GNU Affero General Public License version 3
LICENSE_NAME_RSALv2=	Redis Source Available License v2
LICENSE_NAME_SSPLv1=	Server Side Public License v1
LICENSE_FILE=	${WRKSRC}/LICENSE.txt
LICENSE_PERMS_AGPLv3=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_RSALv2=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept
LICENSE_PERMS_SSPLv1=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		compiler:c11 cpe gmake localbase:ldflags pkgconfig tcl:test
CPE_VENDOR=	redis
USE_RC_SUBR=	redis sentinel

MAKE_ENV=	OPTIMIZATION= \
		V=yo

CONFLICTS_INSTALL=	redis-devel redis[0-9]*

BINARY_ALIAS=	gmd5sum=md5sum
PORTSCOUT=	limit:^[0-9\.]*$$
SUB_FILES=	pkg-message
SUB_LIST=	PORTNAME=${PORTNAME} \
		REDIS_DBDIR=${REDIS_DBDIR} \
		REDIS_GROUP=${GROUPS} \
		REDIS_LOGDIR=${REDIS_LOGDIR} \
		REDIS_RUNDIR=${REDIS_RUNDIR} \
		REDIS_USER=${USERS}

USERS=		redis
GROUPS=		redis

PLIST_SUB=	REDIS_DBDIR=${REDIS_DBDIR} \
		REDIS_GROUP=${GROUPS} \
		REDIS_LOGDIR=${REDIS_LOGDIR} \
		REDIS_RUNDIR=${REDIS_RUNDIR} \
		REDIS_USER=${USERS}

OPTIONS_DEFINE=		JEMALLOC TLS
OPTIONS_DEFAULT=	TLS
OPTIONS_GROUP=		MODULES
OPTIONS_GROUP_MODULES=	REDISBLOOM REDISJSON
OPTIONS_SUB=		yes

JEMALLOC_DESC=	Use jemalloc
REDISBLOOM_DESC=	RedisBLOOM module
REDISJSON_DESC=	RedisJSON module
TLS_DESC=	Use TLS (openssl req.)

JEMALLOC_MAKE_ENV=	USE_JEMALLOC=yes
REDISBLOOM_LIB_DEPENDS=	redisbloom.so>=0:databases/redisbloom
REDISJSON_LIB_DEPENDS=	librejson.so>=0:databases/redisjson
TLS_USES=		ssl
TLS_MAKE_ENV=		BUILD_TLS=yes

BIN_FILES=	redis-benchmark redis-check-aof redis-check-rdb redis-cli \
		redis-sentinel redis-server

REDIS_DBDIR?=	/var/db/redis
REDIS_RUNDIR?=	/var/run/redis
REDIS_LOGDIR?=	/var/log/redis

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

post-patch-JEMALLOC-on:
	@${REINPLACE_CMD} '83s!Linux!MidnightBSD!g' ${WRKSRC}/src/Makefile

post-build:
	${SED} ${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/redis.conf > ${WRKDIR}/redis.conf

do-install:
	${INSTALL_PROGRAM} ${BIN_FILES:C!^!${WRKSRC}/src/!} ${PREFIX}/bin/
	${INSTALL_DATA} ${WRKDIR}/redis.conf ${PREFIX}/etc/redis.conf.sample
	${INSTALL_DATA} ${WRKSRC}/sentinel.conf ${PREFIX}/etc/sentinel.conf.sample
	${MKDIR} ${REDIS_LOGDIR} \
		${REDIS_DBDIR} \
		${REDIS_RUNDIR}

do-test:
	@cd ${WRKSRC} && ${TCLSH} tests/test_helper.tcl

.include <bsd.port.post.mk>
