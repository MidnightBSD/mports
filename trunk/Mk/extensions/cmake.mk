# $MidnightBSD: mports/Mk/extensions/cmake.mk,v 1.2 2008/10/24 20:33:50 ctriv Exp $
#

.if !defined(_POSTMKINCLUDED) && !defined(Cmake_Pre_Include)

Cmake_Pre_Include = cmake.mk

# USE_CMAKE			- If set, this port uses cmake.
#
# CMAKE_ENV			- Environment passed to cmake.
#					Default: ${CONFIGURE_ENV}
# CMAKE_ARGS		- Arguments passed to cmake
#					Default: see below
# CMAKE_USE_PTHREAD	- Instruct cmake to use pthreads when 
#					compiling/linking
#					Default: not set
# CMAKE_BUILD_TYPE	- Type of build (release, debug)
#					Default: Release
# CMAKE_VERBOSE		- Verbose build
#					Default: not set
# CMAKE_SOURCE_PATH	- Path to sourcedir for cmake
#					Default: .
# CMAKE_INSTALL_PREFIX	- prefix for cmake to use for installation.
#					Default: ${PREFIX}

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
CMAKE_ARGS+=	-DCMAKE_C_COMPILER:STRING="${CC}" \
				-DCMAKE_CXX_COMPILER:STRING="${CXX}" \
				-DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
				-DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
				-DCMAKE_INSTALL_PREFIX:PATH="${CMAKE_INSTALL_PREFIX}" \
				-DCMAKE_BUILD_TYPE:STRING="${CMAKE_BUILD_TYPE}"

#
# Default build type and sourcedir
#
CMAKE_BUILD_TYPE?=	Release
CMAKE_SOURCE_PATH?=	.
CMAKE_INSTALL_PREFIX?=	${PREFIX}

#
# Instruct cmake to compile/link with pthreads
#
.if defined(CMAKE_USE_PTHREAD)
CFLAGS+=		${PTHREAD_CFLAGS}
CXXFLAGS+=		${PTHREAD_CFLAGS}

CMAKE_ARGS+=	-DCMAKE_THREAD_LIBS:STRING="${PTHREAD_LIBS}" \
				-DCMAKE_USE_PTHREADS:BOOL=ON \
				-DCMAKE_EXE_LINKER_FLAGS:STRING="${PTHREAD_LIBS}"
.endif

#
# Force DEBUG buildtype if needed
#
.if defined(CMAKE_DEBUG) || defined(WITH_DEBUG)
CMAKE_BUILD_TYPE=DEBUG
.endif

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
	@cd ${WRKSRC}; ${SETENV} ${CMAKE_ENV} ${CMAKE_BIN} ${CMAKE_ARGS} ${CMAKE_SOURCE_PATH}
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
