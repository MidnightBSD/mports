PORTNAME=	build2
DISTVERSION=	0.17.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://download.build2.org/${DISTVERSION}/
DISTNAME=	build2-toolchain-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform toolchain for building and packaging C++ code
WWW=		https://build2.org

LICENSE=	bsd2 bsd3 mit
LICENSE_COMB=	multi

USES=		gmake pkgconfig sqlite tar:xz

PIE_UNSAFE=	yes

# Fix build on i386/powerpc: error: timestamp is not lock-free on this architecture
CXXFLAGS_i386=		-DLIBBUILD2_ATOMIC_NON_LOCK_FREE
CXXFLAGS_powerpc=	-DLIBBUILD2_ATOMIC_NON_LOCK_FREE

# warning: clang@/usr/local/libexec/ccache/clang looks like a ccache wrapper
#  info: ccache cannot be used as a C compiler
#  info: use config.c to override
NO_CCACHE=	yes

PLIST_SUB=	SOVERSION=${DISTVERSION:R}

OPTIONS_DEFINE=	DOCS

pre-build:
# phase 1
	@cd ${WRKSRC}/build2 && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		${MAKE_CMD} ${MAKE_FLAGS} bootstrap.gmake ${_MAKE_JOBS}

do-build:
# phase 2
	@cd ${WRKSRC}/build2 && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		./build2/b-boot \
		config.cxx=${CXX} \
		config.cxx.coptions="${CXXFLAGS}" \
		config.cxx.loptions="${LDFLAGS} -s" \
		config.bin.lib=static \
		build2/exe{b} \
		-V -j ${MAKE_JOBS_NUMBER} -J ${MAKE_JOBS_NUMBER}
	${MV} ${WRKSRC}/build2/build2/b ${WRKSRC}/build2/build2/b-boot

do-install:
# "stage" (local installation)
	@cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${MAKE_ENV} \
		./build2/build2/b-boot configure \
		config.cxx=${CXX} \
		config.cxx.coptions="${CXXFLAGS}" \
		config.cxx.loptions="${LDFLAGS} -s" \
		config.bin.lib=shared \
		config.import.libsqlite3= \
		config.bin.rpath=${TRUE_PREFIX}/lib \
		config.install.chroot=${FAKE_DESTDIR} \
		config.install.root=${TRUE_PREFIX}
	@cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${FAKE_MAKEENV} \
		./build2/build2/b-boot install: build2/ bpkg/ bdep/ \
		-V -j ${MAKE_JOBS_NUMBER} -J ${MAKE_JOBS_NUMBER}
	@cd ${WRKSRC} && ${SETENVI} ${WRK_ENV} ${FAKE_MAKEENV} \
		./build2/build2/b-boot install: '!config.install.scope=project' libbuild2-*/ \
		-V -j ${MAKE_JOBS_NUMBER} -J ${MAKE_JOBS_NUMBER}

.include <bsd.port.mk>
