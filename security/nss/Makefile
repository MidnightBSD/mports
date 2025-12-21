PORTNAME=	nss
PORTVERSION=	3.113.1
CATEGORIES=	security
MASTER_SITES=	MOZILLA/security/${PORTNAME}/releases/${DISTNAME:tu:C/[-.]/_/g}_RTM/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries to support development of security-enabled applications
WWW=		https://firefox-source-docs.mozilla.org/security/nss/index.html

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/COPYING

BUILD_DEPENDS=	${BUILD_DEPENDS_${ARCH}}
BUILD_DEPENDS_powerpc64le=	as:devel/binutils
LIB_DEPENDS=	libnspr4.so:devel/nspr \
		libsqlite3.so:databases/sqlite3
BUILD_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3
RUN_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3
TEST_DEPENDS=	bash:shells/bash

USES=		cpe gmake perl5

WRKSRC_SUBDIR=	nss

USE_LDCONFIG=	yes
CPE_VENDOR=	mozilla
CPE_PRODUCT=	network_security_services
USE_PERL5=	build
MAKE_ENV=	NSPR_LIB_DIR="${LOCALBASE}/lib" \
		SQLITE_INCLUDE_DIR="${LOCALBASE}/include" \
		FREEBL_LOWHASH=1 \
		NSS_ENABLE_WERROR=0 \
		NSS_DISABLE_GTESTS=1 \
		NSS_USE_SYSTEM_SQLITE=1
CFLAGS+=	-iquote ./mpi -I${LOCALBASE}/include/nspr -Wno-error=unused-function

NO_TEST=	yes

SUB_FILES=	nss-config nss.pc
SUB_LIST=	PORTVERSION=${PORTVERSION}

DIST=		${WRKSRC:H}/dist

EXTRACT_AFTER_ARGS=--exclude */lib/zlib --exclude */lib/dbm --exclude */lib/sqlite

INSTALL_BINS=	certutil cmsutil crlutil derdump makepqg \
		mangle modutil ocspclnt oidcalc p7content p7env p7sign \
		p7verify pk12util rsaperf shlibsign signtool signver \
		ssltap strsclnt symkeyutil vfychain vfyserv

OPTIONS_DEFINE=	DEBUG

VSX_CFLAGS=	-DUSE_PPC_CRYPTO
VSX_DESC=	Use VSX optimized routines (POWER8 or newer)

TESTING_UNSAFE=	Fatal DOMSUF env. variable is not defined

.include <bsd.mport.options.mk>

.if ! ${PORT_OPTIONS:MDEBUG}
MAKE_ENV+=	BUILD_OPT=1
BINS=		${DIST}/${OPSYS}${OSREL}_OPT.OBJ
.else
BINS=		${DIST}/${OPSYS}${OSREL}_DBG.OBJ
.endif

.if ${ARCH} == armv6
MAKE_ENV+=	NSS_DISABLE_ARM32_NEON=1
.endif

.if ${ARCH} == amd64
USE_BINUTILS=	# intel-gcm.s
CC+=	-B${LOCALBASE}/bin
.endif

post-patch:
	@${REINPLACE_CMD} '/NSS_DEFAULT_SYSTEM/s,/etc,${PREFIX}&,' \
		${WRKSRC}/lib/sysinit/nsssysinit.c
	@cd ${WRKSRC} && \
		${FIND} . -name "*.c" -o -name "*.h" | \
		${XARGS} ${REINPLACE_CMD} -e 's|"nspr.h"|<nspr.h>|'
	${FIND} ${WRKSRC}/tests -name '*.sh' | ${XARGS} ${GREP} -l -F '/bin/bash' | \
		${XARGS} ${REINPLACE_CMD} -e 's|#! */bin/bash|#!${SH}|'
	${REINPLACE_CMD} -e 's/FreeBSD/FreeBSD MidnightBSD/g' \
		${WRKSRC}/coreconf/config.mk

do-install:
	${MKDIR} ${PREFIX}/include/nss ${PREFIX}/lib
	${FIND} ${DIST}/public/nss -type l \
		-exec ${INSTALL_DATA} {} ${PREFIX}/include/nss \;
	${INSTALL_LIB} ${BINS}/lib/*.so \
		${PREFIX}/lib/
	${INSTALL_DATA} ${BINS}/lib/libcrmf.a \
		${PREFIX}/lib/
.for bin in ${INSTALL_BINS}
	${INSTALL_PROGRAM} ${BINS}/bin/${bin} \
		${PREFIX}/bin
.endfor
	${INSTALL_SCRIPT} ${WRKDIR}/nss-config ${PREFIX}/bin
	${INSTALL_DATA} ${WRKDIR}/nss.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
