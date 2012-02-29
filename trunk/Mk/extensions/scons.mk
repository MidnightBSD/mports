#-*- mode: Makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD: mports/Mk/extensions/scons.mk,v 1.1 2008/10/24 20:33:51 ctriv Exp $
# $FreeBSD: ports/Mk/bsd.scons.mk,v 1.6 2006/08/04 12:34:41 erwin Exp $
#
# bsd.scons.mk - Python-based SCons build system interface.
# Author: Alexander Botero-Lowry <alex@foxybanana.com>
#
# Please view me with 4 column tabs!

.if defined(_POSTMKINCLUDED) && !defined(Scons_Post_Include)

Scons_Post_Include=			scons.mk
Scons_Include_MAINTAINER=	ports@MidnightBSD.org

#
# SCONS_BIN is the location where the scons port installs the scons
# executable.
#
# SCONS_PORT is where the scons port is located in the ports tree.
#
SCONS_BIN=	${LOCALBASE}/bin/scons
SCONS_PORT=	${PORTSDIR}/devel/scons

#
# CCFLAGS is the scons equivalent of CFLAGS. So we should bring in our
# FreeBSD CFLAGS.
#
# LINKFLAGS is equivalent to LDFLAGS in make speak, so we bring in the
# FreeBSD default LDFLAGS.
#
# Some scons projects may honor PKGCONFIGDIR, which tells them where to
# look for, and install, pkgconfig files.
#
# LIBPATH is the search path for libraries. Bring in some safe defaults.
#
# CPPPATH is the search path for includes, Again, bring in some safe defaults.
#
CCFLAGS?=	${CFLAGS}
LINKFLAGS?=	${LDFLAGS}
PKGCONFIGDIR?=	${LOCALBASE}/libdata/pkgconfig
LIBPATH?=	${LOCALBASE}/lib
CPPPATH?=	${LOCALBASE}/include

#
# SCONS_ENV is where we pass all the stuff that should be the
# same for any scons port to scons. Things like CCFLAGS, and LINKFLAGS
# go here.
#
# SCONS_ARGS is where you pass port specific scons flags to the scons
# environment.
#
# SCONS_BUILDENV is where you pass variables you want to be in the
# System Environment instead of the SCons Environment.
#
# SCONS_TARGET is the same as MAKE_TARGET it is passed as the last
# argument to scons.
#
SCONS_ENV?=	CCFLAGS="${CCFLAGS}" CXXFLAGS="${CXXFLAGS}" \
		LINKFLAGS="${LINKFLAGS}" PKGCONFIGDIR="${PKGCONFIGDIR}"  \
		CPPPATH="${CPPPATH}" LIBPATH="${LIBPATH}" PREFIX="${PREFIX}" \
		DESTDIR="${DESTDIR}" CC="${CC}" CXX="${CXX}"
SCONS_ARGS?=
SCONS_BUILDENV?=
SCONS_TARGET?=

#
# SCONS_INSTALL_TARGET is the default target to be used when
# installing a port using scons.
#
SCONS_INSTALL_TARGET?=	${INSTALL_TARGET}

#
# Make sure we depend on scons
#
BUILD_DEPENDS+=	${SCONS_BIN}:${SCONS_PORT}

.if !target(do-build)
do-build:
	@cd ${BUILD_WRKSRC} && \
	${SETENV} ${SCONS_BUILDENV} ${SCONS_BIN} ${SCONS_ENV} ${_MAKE_JOBS} \
	${SCONS_ARGS} ${SCONS_TARGET}
.endif

.if !target(do-install)
do-install:
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${SCONS_BUILDENV} ${SCONS_BIN} \
	${SCONS_ENV} ${SCONS_ARGS} ${SCONS_INSTALL_TARGET}
.endif



.endif # defined(_POSTMKINCLUDED) && !defined(Scons_Post_Include)
