PORTNAME=	cabal-install
DISTVERSION=	3.2.0.0
PORTREVISION=	1
CATEGORIES=	devel haskell
EXTRACT_ONLY=	${PORTNAME}-${PORTVERSION}${CABAL_EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line interface for Cabal and Hackage

LICENSE=	bsd3

BUILD_DEPENDS=	ghc:lang/ghc

USES=		cabal compiler:c11

USE_CABAL=	async-2.2.2_1 base16-bytestring-0.1.1.6 base64-bytestring-1.0.0.1 \
		cryptohash-sha256-0.11.101.0_4 digest-0.0.1.2 echo-0.1.3_1 \
		ed25519-0.0.5.0_2 edit-distance-0.2.2.1_1 hackage-security-0.6.0.1 \
		hashable-1.3.0.0_1 HTTP-4000.3.14_1 lukko-0.1.1.2 mintty-0.1.2 network-2.7.0.0 \
		network-uri-2.6.1.0_1 random-1.1_1 resolv-0.1.2.0 tar-0.5.1.1_2 \
		zip-archive-0.3.3_1 zlib-0.6.2.1_1

CABAL_BOOTSTRAP=	yes

PLIST_FILES=	bin/cabal

post-extract:
.for package in ${USE_CABAL}
	${CP} ${DISTDIR}/${DIST_SUBDIR}/${package:C/_[0-9]+//}/${package:C/_[0-9]+//}${EXTRACT_SUFX} ${WRKSRC}

.	if ${package:C/[^_]*//:S/_//} != ""
		${CP} ${DISTDIR}/${DIST_SUBDIR}/${package:C/_[0-9]+//}/revision/${package:C/[^_]*//:S/_//}.cabal ${WRKSRC}/${package:C/[0-9._]*$//:S/-$//}.cabal.hackage
.	else
		tar -C ${WRKDIR} -xf ${DISTDIR}/${DIST_SUBDIR}/${package:C/_[0-9]+//}/${package:C/_[0-9]+//}${EXTRACT_SUFX} --include='*.cabal'
		${MV} ${WRKDIR}/${package:C/_[0-9]+//}/${package:C/[0-9._]*$//:S/-$//}.cabal ${WRKSRC}/${package:C/[0-9._]*$//:S/-$//}.cabal.hackage
.	endif
.endfor

do-build:
	cd ${WRKSRC} && \
		${SETENV} -u VERBOSE EXTRA_CONFIGURE_OPTS="--disable-library-profiling" \
			${MAKE_ENV} HOME=${WRKDIR}/home PREFIX=${WRKDIR}/prefix \
			${WRKSRC}/bootstrap.sh --no-doc --jobs ${MAKE_JOBS_NUMBER}

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/prefix/bin/cabal ${STAGEDIR}${PREFIX}/bin/

.include <bsd.port.mk>
