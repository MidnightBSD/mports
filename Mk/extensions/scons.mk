#-*- mode: Makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD$
# $FreeBSD: ports/Mk/bsd.scons.mk,v 1.6 2006/08/04 12:34:41 erwin Exp $
#
# bsd.scons.mk - Python-based SCons build system interface.
# Author: Alexander Botero-Lowry <alex@foxybanana.com>
#
# Please view me with 4 column tabs!

.if !defined(_INCLUDE_USES_SCONS_MK)
_INCLUDE_USES_SCONS_MK=	yes

.if !empty(scons_ARGS)
IGNORE=	Incorrect 'USES+= scons:${scons_ARGS}' scons takes no arguments
.endif

MAKEFILE=		#
MAKE_FLAGS=		#
ALL_TARGET?=		#
CCFLAGS?=		${CFLAGS}
LINKFLAGS?=		${LDFLAGS}
LIBPATH?=		${LOCALBASE}/lib
CPPPATH?=		${LOCALBASE}/include
SCONS=			${LOCALBASE}/bin/scons
BUILD_DEPENDS+=		${SCONS}:devel/scons@${PY_FLAVOR}
MAKE_CMD=		${SCONS}
MAKE_ARGS+=	CCFLAGS="${CCFLAGS}" CXXFLAGS="${CXXFLAGS}" \
		LINKFLAGS="${LINKFLAGS}" PKGCONFIGDIR="${PKGCONFIGDIR}"  \
		CPPPATH="${CPPPATH}" LIBPATH="${LIBPATH}" PREFIX="${PREFIX}" \
		CC="${CC}" CXX="${CXX}" ${DESTDIRNAME:tl}=${FAKE_DESTDIR}

.endif
