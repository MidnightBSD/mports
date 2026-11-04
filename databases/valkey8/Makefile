PORTNAME=	valkey
DISTVERSION=	8.1.8
CATEGORIES=	databases
PKGNAMESUFFIX=	8

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	High-performance data structure server that primarily serves key/value workloads (8.X.X series)
WWW=		https://valkey.io/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

USES=		cpe gmake pkgconfig tcl:test
USE_GITHUB=	yes
GH_ACCOUNT=	valkey-io
USE_RC_SUBR=	valkey valkeysentinel

CPE_VENDOR=	lfprojects

MAKE_ENV=	OPTIMIZATION= \
		V=1

LDFLAGS+=	-lpthread -lm -lexecinfo

CONFLICTS_INSTALL=	valkey*

SUB_FILES=	pkg-message
SUB_LIST+=	PORTNAME=${PORTNAME} \
		VALKEY_DBDIR=${VALKEY_DBDIR} \
		VALKEY_LOGDIR=${VALKEY_LOGDIR} \
		VALKEY_RUNDIR=${VALKEY_RUNDIR} \
		VALKEY_USER=${USERS}

USERS=		valkey
GROUPS=		valkey

PLIST_SUB+=	VALKEY_DBDIR=${VALKEY_DBDIR} \
		VALKEY_GROUP=${GROUPS} \
		VALKEY_LOGDIR=${VALKEY_LOGDIR} \
		VALKEY_RUNDIR=${VALKEY_RUNDIR} \
		VALKEY_USER=${USERS}

OPTIONS_DEFINE=		JEMALLOC TLS
OPTIONS_DEFAULT=	TLS
OPTIONS_SUB=		yes

JEMALLOC_DESC=	Use jemalloc
TLS_DESC=	Use TLS

JEMALLOC_MAKE_ENV=	MALLOC=jemalloc
TLS_USES=		ssl
TLS_MAKE_ENV=		BUILD_TLS=yes

VALKEY_DBDIR?=	/var/db/valkey
VALKEY_RUNDIR?=	/var/run/valkey
VALKEY_LOGDIR?=	/var/log/valkey

NO_TEST=	yes

post-build:
	${SED} ${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/valkey.conf > ${WRKDIR}/valkey.conf
	${SED} ${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} \
		${WRKSRC}/sentinel.conf > ${WRKDIR}/valkey-sentinel.conf

post-install:
	${INSTALL_DATA} ${WRKDIR}/valkey.conf ${PREFIX}/etc/valkey.conf.sample
	${INSTALL_DATA} ${WRKDIR}/valkey-sentinel.conf ${PREFIX}/etc/valkey-sentinel.conf.sample
	${MKDIR} ${FAKE_DESTDIR}${VALKEY_LOGDIR} \
		${FAKE_DESTDIR}${VALKEY_DBDIR} \
		${FAKE_DESTDIR}${VALKEY_RUNDIR}
	${STRIP_CMD} ${PREFIX}/bin/valkey-benchmark
	${STRIP_CMD} ${PREFIX}/bin/valkey-cli
	${STRIP_CMD} ${PREFIX}/bin/valkey-server

#do-test:
#	@cd ${WRKSRC} && ${TCLSH} tests/test_helper.tcl

.include <bsd.port.mk>
