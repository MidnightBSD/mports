# $MidnightBSD: mports/security/nss/Makefile,v 1.9 2009/10/13 04:08:44 laffer1 Exp $

PORTNAME=	nss
PORTVERSION=	3.11.9
PORTREVISION=	1
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
USE_LDCONFIG=	yes
USE_GMAKE=	yes
USE_PERL5_BUILD=yes
MAKE_ENV=	BSD_LDOPTS="${PTHREAD_LIBS} -L${LOCALBASE}/lib" \
		BUILD_OPT=1 NSS_ENABLE_ECC=1
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

BINS=${DIST}/${OPSYS}${OSREL}_OPT.OBJ

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
	${MKDIR} ${PREFIX}/include/nss
	${TAR} -C ${DIST}/public --dereference -cf - . | \
		${TAR} -C ${PREFIX}/include/nss -xf -
	${INSTALL_DATA} ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib/*.so.1 \
		${PREFIX}/lib
	${INSTALL_DATA} ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib/libcrmf.a \
		${PREFIX}/lib
	${INSTALL_PROGRAM} `${SED}	\
	    -e 's|^bin/|${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/bin/|' \
	    -e t -e d ${PLIST}` ${PREFIX}/bin/
	cd ${DIST}/MidnightBSD${OSREL:C/.$/*/}_OPT.OBJ/lib && \
		${TAR} -cf - *.so | ${TAR} --unlink -C ${PREFIX}/lib -xf -

.include <bsd.port.post.mk>
