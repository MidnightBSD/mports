PORTNAME=	metis
PORTVERSION=	5.1.0
PORTREVISION=	6
CATEGORIES=	math
MASTER_SITES=	http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Package for unstructured graph partitioning

LICENSE=	Apache-2.0

CONFLICTS=	metis4-4* metis-edf-[0-9]*

USES=		cmake:noninja compiler:c11

OPTIONS_DEFINE=	OPENMP SHARED STATIC DOCS

OPENMP_DESC=	multithreading via OpenMP
#PROFILE_DESC=	profiling libraries
SHARED_DESC=	shared library and dynamically-linked executables
STATIC_DESC=	libmetis archive

OPTIONS_DEFAULT=	SHARED STATIC

BINS=	cmpfillin gpmetis graphchk m2gmetis mpmetis ndmetis

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MOPENMP}
CMAKE_ARGS+=	-DOPENMP=1
USE_GCC=	any
.endif

.if ${PORT_OPTIONS:MSHARED}
ALL_TARGET_SHARED=	all
CMAKE_ARGS_SHARED=	-DSHARED=1
PLIST_SUB+=		SHARED=""
.if ${ARCH} == "sparc64"
SHARED_FLAGS?=		-fPIC
.else
SHARED_FLAGS?=		-fpic
.endif
SHLIB_MAJOR?=		2
CMAKE_ARGS+=		-DSHLIB_MAJOR="${SHLIB_MAJOR}"
USE_LDCONFIG=		yes
WRKSRC_SHARED=		${WRKSRC}_SHARED
INSTALL_WRKSRC_SHARED=	${WRKSRC_SHARED}
.else
PLIST_SUB+=		SHARED="@comment "
.endif

.if ${PORT_OPTIONS:MSTATIC}
ALL_TARGET_STATIC=	metis
PLIST_SUB+=		STATIC=""
WRKSRC_STATIC=		${WRKSRC}
INSTALL_WRKSRC_STATIC=	${WRKSRC_STATIC}/libmetis
.else
PLIST_SUB+=		STATIC="@comment "
.endif

pre-configure:
	@${REINPLACE_CMD} -e "/^# Add compiler flags/,/^$$/d" \
	-e "/^check_include_file(execinfo.h/d" \
	${WRKSRC}/GKlib/GKlibSystem.cmake
	@${REINPLACE_CMD} -e "\|/home/karypis/|d" \
	${WRKSRC}/programs/CMakeLists.txt
.if ((${ARCH}=="amd64") || (${ARCH}=="aarch64") || (${ARCH}=="sparc64") || (${ARCH}=="powerpc64"))
	@${REINPLACE_CMD}-e \
		's|IDXTYPEWIDTH 32|IDXTYPEWIDTH 64|' \
		${WRKSRC}/include/metis.h
.endif
.for o in SHARED #PROFILE
.if ${PORT_OPTIONS:M${o}}
	@${CP} -R ${WRKSRC} ${WRKSRC_${o}}
.endif
.endfor

do-configure:
.for o in SHARED STATIC #PROFILE
.if ${PORT_OPTIONS:M${o}}
	@${PRINTF} "\n\nConfiguring ${o}:\n\n\n"
	@cd ${WRKSRC_${o}}; ${SETENV} ${CONFIGURE_ENV} ${CMAKE_BIN} \
	${CMAKE_ARGS:C|${CFLAGS}|& ${${o}_FLAGS}|g} ${CMAKE_ARGS_${o}} \
	-DGKLIB_PATH="${WRKSRC_${o}}/GKlib" ${CMAKE_SOURCE_PATH}
.endif
.endfor

do-build:
.for o in SHARED STATIC #PROFILE
.if ${PORT_OPTIONS:M${o}}
	@${PRINTF} "\n\nBuilding ${o}:\n\n\n"
	@cd ${WRKSRC_${o}}; ${SETENV} ${MAKE_ENV} ${MAKE} ${_MAKE_JOBS} \
	${MAKE_ARGS} ${ALL_TARGET_${o}}
.endif
.endfor
.if ${PORT_OPTIONS:MSHARED}
	@cd ${WRKSRC_SHARED}/programs; ${STRIP_CMD} ${BINS}
	@cd ${WRKSRC_SHARED}/libmetis; ${STRIP_CMD} libmetis.so.*
.endif
.if ${PORT_OPTIONS:MSTATIC}
	@cd ${WRKSRC_STATIC}/libmetis; ${STRIP_CMD} libmetis.a
.endif

check regression-test test: build
	cd ${WRKSRC_SHARED}/graphs ; ../programs/gpmetis ./4elt.graph 5

do-install:
.for o in SHARED STATIC #PROFILE
.if ${PORT_OPTIONS:M${o}}
	@${PRINTF} "\n\nInstalling ${o}:\n\n\n"
	@cd ${INSTALL_WRKSRC_${o}}; ${SETENV} ${MAKE_ENV} ${MAKE} ${_MAKE_JOBS} \
	${MAKE_ARGS} ${FAKE_MAKEARGS} install
.endif
.endfor

.if ${PORT_OPTIONS:MDOCS}
PORTDOCS=	manual.pdf

post-install:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/manual/manual.pdf ${STAGEDIR}${DOCSDIR}
.endif

.include <bsd.port.mk>
