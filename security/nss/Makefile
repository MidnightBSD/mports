# $MidnightBSD: mports/security/nss/Makefile,v 1.12 2010/11/06 13:30:19 laffer1 Exp $

PORTNAME=	nss
PORTVERSION=	3.12.9
PORTREVISION=	0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_MOZILLA}
MASTER_SITE_SUBDIR=	security/nss/releases/NSS_${PORTVERSION:S/./_/g}_RTM/src

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries to support development of security-enabled applications
LICENSE=	unknown
#mpl?

BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip
LIB_DEPENDS=	nspr4.1:${PORTSDIR}/devel/nspr

WRKSRC=		${WRKDIR}/${DISTNAME}/mozilla/security/nss

MAKE_JOBS_UNSAFE=	yes
USE_LDCONFIG=	${TRUE_PREFIX}/lib/nss
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
MAKE_ENV=	BSD_LDOPTS="${PTHREAD_LIBS} -L${LOCALBASE}/lib" \
		BUILD_OPT=1 NSS_ENABLE_ECC=1 NSS_USE_SYSTEM_SQLITE=1 NS_PTR_GT_32=1
ALL_TARGET=	nss_build_all
CFLAGS+=	-I${LOCALBASE}/include/nspr

DIST=		${WRKSRC:H:H}/dist

.include <bsd.port.pre.mk>

EXTERNALS=	CVS dbm security/nss/cmd/zlib nsprpub security/dbm
EXTRACT_AFTER_ARGS=| ${TAR} -xf -	\
	${EXTERNALS:C,^,--exclude ${DISTNAME}/mozilla/,}

post-patch:
	@${REINPLACE_CMD} -e "s|-pthread|${PTHREAD_LIBS}|g" \
		${WRKSRC:H:H}/security/coreconf/MidnightBSD.mk
	@${SED} -e 's|@exec_prefix@|${PREFIX}|; \
		s|@includedir@|${PREFIX}/include/nss|; \
		s|@libdir@|${PREFIX}/lib/nss|; \
		s|@prefix@|${PREFIX}|' \
		${FILESDIR}/nss-config.in >${WRKDIR}/nss-config
	@${SED} -e 's|@PREFIX@|${PREFIX}|; s|@PORTVERSION@|${PORTVERSION}|' \
		${FILESDIR}/nss.pc.in >${WRKDIR}/nss.pc
	@cd ${WRKSRC} && \
		${FIND} . -name "*.c" -o -name "*.h" | \
		${XARGS} ${REINPLACE_CMD} -e 's|"nspr.h"|<nspr.h>|'

BINS=${DIST}/${OPSYS}${OSREL}_OPT.OBJ
INSTALL_BINS=	certcgi certutil checkcert cmsutil crlutil derdump makepqg \
		mangle modutil ocspclnt oidcalc p7content p7env p7sign \
		p7verify pk12util rsaperf shlibsign signtool signver \
		ssltap strsclnt symkeyutil vfychain vfyserv

test:
	cd ${WRKSRC}/tests;	\
		${SETENV} PATH="${BINS}/bin:${PATH}" \
		    LD_LIBRARY_PATH="${BINS}/lib" \
			./all.sh
	@if ${GREP} -F '>Failed<'	\
	    ${WRKSRC:H:H}/tests_results/security/*/results.html; then	\
		echo "Some tests have failed. Let ${MAINTAINER} know.";	\
		exit 1;	\
	else	\
		echo "All tests succeeded. Good news.";	\
	fi

do-install:
	${MKDIR} ${PREFIX}/include/nss/nss ${PREFIX}/lib/nss
	${FIND} ${DIST}/public/nss -type l \
	    	-exec ${INSTALL_DATA} {} ${PREFIX}/include/nss/nss \;
	${INSTALL_DATA} ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib/*.so.1 \
		${PREFIX}/lib/nss
	${INSTALL_DATA} ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib/libcrmf.a \
		${PREFIX}/lib/nss
.for bin in ${INSTALL_BINS}
	${INSTALL_PROGRAM} ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/bin/${bin} \
		${PREFIX}/bin
.endfor
	cd ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib && \
		${TAR} -cf - *.so | ${TAR} --unlink -C ${PREFIX}/lib/nss -xf -
	${INSTALL_SCRIPT} ${WRKDIR}/nss-config ${PREFIX}/bin
	${INSTALL_DATA} ${WRKDIR}/nss.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.post.mk>
