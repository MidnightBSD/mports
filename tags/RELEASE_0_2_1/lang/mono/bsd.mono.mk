# bsd.mono.mk: accomodate the peculiarities of building C# ports within
# the FreeBSD ports system.
#
# $MidnightBSD$
# $FreeBSD: ports/lang/mono/bsd.mono.mk,v 1.7 2007/03/17 03:48:02 tmclaugh Exp $
#   $Id: bsd.mono.mk,v 1.1 2007-08-22 06:45:19 laffer1 Exp $
#

# USE_NANT		- If set, the port uses nant.
# USE_NANT		- If set "contrib", the port uses nantcontrib.
# NANT			- Set to path of Nant.

# Set the location of the .wapi directory so we write to a location we
# can always assume to be writable.
MONO_SHARED_DIR=${WRKDIR}
CONFIGURE_ENV+=MONO_SHARED_DIR="${MONO_SHARED_DIR}"
MAKE_ENV+=MONO_SHARED_DIR="${MONO_SHARED_DIR}"

# Set the location that webaps served by XSP should use.
XSP_DOCROOT=${PREFIX}/www/xsp

# gac utilities
GACUTIL=${LOCALBASE}/bin/gacutil /root ${PREFIX}/lib/ /gacdir ${PREFIX}/lib
GACUTIL_INSTALL=${GACUTIL} /i
GACUTIL_INSTALL_PACKAGE=${GACUTIL} /i /package 1.0 /package 2.0

# Dependencies 

.if defined(USE_NANT)
BUILD_DEPENDS+=	nant:${PORTSDIR}/devel/nant
.if ${USE_NANT}=="contrib"
BUILD_DEPENDS+=	${LOCALBASE}/share/NAnt/bin/NAnt.Contrib.Tests.dll:${PORTSDIR}/devel/nantcontrib
.endif
.endif

# Miscellaneous overridable commands:

NANT?=	nant
NANT_INSTALL_TARGET?=	install

# Build
.if defined(USE_NANT)
.if !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} MONO_SHARED_DIR="${MONO_SHARED_DIR}" ${NANT} ${NANT_FLAGS})
.endif
.endif


# Install
.if defined(USE_NANT)
.if !target(do-install)
do-install:
	@(cd ${INSTALL_WRKSRC}; ${SETENV} MONO_SHARED_DIR="${MONO_SHARED_DIR}" ${NANT} ${NANT_FLAGS} -D:prefix="${PREFIX}" ${NANT_INSTALL_TARGET})
.endif
.endif
