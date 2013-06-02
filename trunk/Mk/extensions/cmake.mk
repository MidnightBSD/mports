# $MidnightBSD: mports/Mk/extensions/cmake.mk,v 1.7 2012/03/04 21:04:25 laffer1 Exp $
#

.if !defined(_POSTMKINCLUDED) && !defined(Cmake_Pre_Include)

Cmake_Pre_Include = cmake.mk

# USE_CMAKE			- If set, this port uses cmake.
#
# CMAKE_ENV		- Environment passed to cmake.
#				Default: ${CONFIGURE_ENV}
# CMAKE_ARGS		- Arguments passed to cmake
#				Default: see below
# CMAKE_BUILD_TYPE	- Type of build (cmake predefined build types).
#				Projects may have their own build profiles.
#				CMake supports the following types: Debug,
#				Release, RelWithDebInfo and MinSizeRel.
#				Debug and Release profiles respect system
#				CFLAGS, RelWithDebInfo and MinSizeRel will set
#				CFLAGS to "-O2 -g" and "-Os -DNDEBUG".
#				Default: Release, if WITH_DEBUG is not set,
#				Debug otherwise
# CMAKE_VERBOSE		- Verbose build
#				Default: not set
# CMAKE_OUTSOURCE	- Instruct to perform an out-of-source build
# 				Default: not set
# CMAKE_SOURCE_PATH	- Path to sourcedir for cmake
#				Default: ${WRKSRC}
# CMAKE_INSTALL_PREFIX	- prefix for cmake to use for installation.
#				Default: ${PREFIX}
#
#
# $FreeBSD: ports/Mk/bsd.cmake.mk,v 1.13 2011/11/10 19:50:26 rakuco Exp $

CMAKE_MAINTAINER=  ports@MidnightBSD.org

#
# CMAKE_BIN is the location where the cmake port installs the cmake
# executable
#
# CMAKE_PORT is where the cmake port is located in the ports tree
#
CMAKE_BIN=		${LOCALBASE}/bin/cmake
CMAKE_PORT=		${PORTSDIR}/devel/cmake

#
# Make sure we depend on cmake
#
BUILD_DEPENDS+=	${CMAKE_BIN}:${CMAKE_PORT}

#
# Default environment and arguments to cmake
#
CMAKE_ENV?=		${CONFIGURE_ENV}
CMAKE_ARGS+=		-DCMAKE_C_COMPILER:STRING="${CC}" \
			-DCMAKE_CXX_COMPILER:STRING="${CXX}" \
			-DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
			-DCMAKE_C_FLAGS_DEBUG:STRING="${CFLAGS}" \
			-DCMAKE_C_FLAGS_RELEASE:STRING="${CFLAGS}" \
			-DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
			-DCMAKE_CXX_FLAGS_DEBUG:STRING="${CXXFLAGS}" \
			-DCMAKE_CXX_FLAGS_RELEASE:STRING="${CXXFLAGS}" \
			-DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
			-DCMAKE_MODULE_LINKER_FLAGS:STRING="${LDFLAGS}" \
			-DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}" \
			-DCMAKE_INSTALL_PREFIX:PATH="${CMAKE_INSTALL_PREFIX}" \
			-DCMAKE_BUILD_TYPE:STRING="${CMAKE_BUILD_TYPE}" \
			-DTHREADS_HAVE_PTHREAD_ARG:BOOL=YES

.if defined(BATCH) || defined(PACKAGE_BUILDING)
CMAKE_VERBOSE=		yes
CMAKE_NOCOLOR=		yes
.endif

#
# Default build type and sourcedir
#
CMAKE_SOURCE_PATH?=	${WRKSRC}
.if defined(CMAKE_OUTSOURCE)
CONFIGURE_WRKSRC=	${WRKDIR}/.build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC=		${CONFIGURE_WRKSRC}
.endif
CMAKE_INSTALL_PREFIX?=	${PREFIX}

.if defined(WITH_DEBUG)
CMAKE_BUILD_TYPE?=	Debug
.else
CMAKE_BUILD_TYPE?=	Release
.endif

.if defined(STRIP) && ${STRIP} != ""
INSTALL_TARGET?=	install/strip
.endif

PLIST_SUB+=	CMAKE_BUILD_TYPE="${CMAKE_BUILD_TYPE:L}"

#
# Force makefile verbosity if needed
#
.if defined(CMAKE_VERBOSE) || defined(BATCH)
CMAKE_ARGS+=	-DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
.endif

#
# Redefine do-configure target
#
.if !target(do-configure)
do-configure:
	@${MKDIR} ${CONFIGURE_WRKSRC}
	@cd ${CONFIGURE_WRKSRC}; ${SETENV} ${CMAKE_ENV} ${CMAKE_BIN} ${CMAKE_ARGS} ${CMAKE_SOURCE_PATH}
.endif


.endif

#
# make sure DESTDIRNAME is DESTDIR (qt4 does this another way, and may ports use both cmake 
# and qt4
#
.if defined(_POSTMKINCLUDED) && !defined(Cmake_Post_Include)

Cmake_Post_Include= cmake.mk
 

DESTDIRNAME= DESTDIR

.endif # defined(_POSTMKINCLUDED) && !defined(Cmake_Post_Include)
