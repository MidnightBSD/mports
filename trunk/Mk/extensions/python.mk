# -*- tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD$
# $FreeBSD: ports/Mk/bsd.python.mk,v 1.81 2006/08/04 12:34:41 erwin Exp $
#

.if !defined(_POSTMKINCLUDED) && !defined(Python_Pre_Include)

Python_Pre_Include=			python.mk
Python_Include_MAINTAINER=	ports@MidnightBSD.org

# This file contains some variable definitions that are supposed to
# make your life easier when dealing with ports related to the Python
# language. It's automatically included when USE_PYTHON or PYTHON_VERSION
# is defined in the ports' makefile. Define PYTHON_VERSION to override the
# defaults that USE_PYTHON would give you. If your port requires only some
# set of Python versions, you can define USE_PYTHON as [min]-[max] or
# min+. (eg. 3.1-3.2, 2.7+ or -3.2)
#
# The variables:
#
# PYTHONBASE		- Python port's installation prefix.
#					  default: ${LOCALBASE}
#
# PYTHON_CMD		- Python's command line file name, including the version
#					  number (used for dependencies).
#					  default: ${PYTHONBASE}/bin/${PYTHON_VERSION}
#
# PYTHON_DISTFILE	- The ${DISTFILE} for your python version. Needed for
#					  extensions like Tkinter, py-gdbm and py-expat, which
#					  are built from sources contained in the Python
#					  distribution.
#
# PYTHON_MASTER_SITES
#					- The ${MASTER_SITES} for your python version. (You must
#					  use this instead of ${MASTER_SITE_PYTHON} to support
#					  python-devel port.)
#
# PYTHON_MASTER_SITE_SUBDIR
#					- The ${MASTER_SITE_SUBDIR} for your python version.
#
# PYTHON_INCLUDEDIR	- Location of the Python include files.
#					  default: ${PYTHONBASE}/include/${PYTHON_VERSION}
#
# PYTHON_LIBDIR		- Base of the python library tree
#					  default: ${PYTHONBASE}/lib/${PYTHON_VERSION}
#
# PYTHON_PKGNAMEPREFIX
#					- Use this as a ${PKGNAMEPREFIX} to distinguish
#					  packages for different Python versions.
#					  default: py${PYTHON_SUFFIX}-
#
# PYTHON_PKGNAMESUFFIX
#					- If your port's name is more popular without `py-'
#					  prefix, use this as a ${PKGNAMESUFFIX} alternatively.
#					  default: -py${PYTHON_SUFFIX}
#
# PYTHON_PLATFORM	- Python's idea of the OS release.
#					  XXX This is faked with ${OPSYS} and ${OSREL} until I
#					  find out how to delay defining a variable until after
#					  a certain target has been built.
#
# PYTHON_PORTSDIR	- The source of your binary's port. Needed for the
#					  RUN_DEPENDS.
#
# PYTHON_PORTVERSION
#					- Version number suitable for ${PORTVERSION}.
#
# PYTHON_REL		- Version number in numerical format, to ease
#					  comparison in makefiles
#
# PYTHON_SITELIBDIR	- Location of the site-packages tree. Don't change,
#					  unless you know what you do.
#					  default: ${PYTHON_LIBDIR}/site-packages
#
# PYTHON_SUFFIX		- Yet another short version number, primarily intended
#					  for ${PYTHON_PKGNAMEPREFIX}.
#
# PYTHON_VERSION	- Version of the python binary in your ${PATH}, in the
#					  format "python2.0". Set this in your makefile in case you
#					  want to build extensions with an older binary.
#					  default: depends on the version of your python binary
#
# PYTHON_DEFAULT_VERSION
#					- Version of the default python binary in your ${PATH}, in
#					  the format "python2.7". Set this in your /etc/make.conf
#					  in case you want to use an older version as a default.
#					  default: python2.7
#
# PYTHON3_DEFAULT_VERSION
#					- Version of the default python binary in your ${PATH}, in
#					  the format "python3.2". Set this in your /etc/make.conf
#					  in case you want to use an older version as a default.
#					  default: python3.3
#
# PYTHON_MAJOR_VER	- Python version major number. 2 for python-2.x,
#					  3 for python-3.x and so on.
#
# PYTHON_WRKSRC		- The ${WRKSRC} for your python version. Needed for
#					  extensions like Tkinter, py-gdbm and py-expat, which
#					  are built from sources contained in the Python
#					  distribution.
#
# There are PREFIX-clean variants of the PYTHON_*DIR variables above.
# They are meant to be used in the installation targets.
#
# PYTHONPREFIX_INCLUDEDIR	default: ${PREFIX}/include/${PYTHON_VERSION}
# PYTHONPREFIX_LIBDIR		default: ${PREFIX}/lib/${PYTHON_VERSION}
# PYTHONPREFIX_SITELIBDIR	default: ${PYTHONPREFIX_LIBDIR}/site-packages
#
# PYGAME			- Dependency line for the Pygame library.
#
# PYNUMERIC			- Dependency line for the numeric extension.
#
# PYNUMPY			- Dependency line for the new numeric extension.
#                     py-numpy, Py-Numeric is deprecated.
#
# PYXML				- Dependency line for the XML extension. As of Python-2.0,
#					  this extension is in the base distribution.
#
# USE_PYTHON_PREFIX	- Says that the port installs in ${PYTHONBASE}.
#
# USE_PYDISTUTILS	- Use distutils as do-configure, do-build and do-install
#					  targets.
#
# PYSETUP			- Name of the setup script used by the distutils package.
#					  default: setup.py
#
# PYDISTUTILS_PKGNAME
#					- Internal name in the distutils for egg-info.
#					  default: ${PORTNAME}
#
# PYDISTUTILS_PKGVERSION
#					- Internal version in the distutils for egg-info.
#					  default: ${PORTVERSION}
#
# PYDISTUTILS_CONFIGURE_TARGET
#					- Pass this command to distutils on configure stage.
#					  default: config
#
# PYDISTUTILS_BUILD_TARGET
#					- Pass this command to distutils on build stage.
#					  default: build
#
# PYDISTUTILS_INSTALL_TARGET
#					- Pass this command to distutils on install stage.
#					  default: install
#
# PYDISTUTILS_CONFIGUREARGS
#					- Arguments to config with distutils.
#					  default: <empty>
#
# PYDISTUTILS_BUILDARGS
#					- Arguments to build with distutils.
#					  default: <empty>
#
# PYDISTUTILS_INSTALLARGS
#					- Arguments to install with distutils.
#					  default: -c -O1 --prefix=${PREFIX}
#
# PYDISTUTILS_EGGINFO
#					- Canonical name for egg-info.
#					  default: ${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}.egg-info
#
# PYDISTUTILS_NOEGGINFO
#					- Skip an egg-info entry from plist when defined.
#
# PYEASYINSTALL_EGG
#					- Canonical directory name for easy_install egg packages.
#					  default: ${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}${PYEASYINSTALL_OSARCH}.egg
#
# PYEASYINSTALL_OSARCH
#					- Platform identifier for easy_install.
#					  default: -${OPSYS:L}-${_OSRELEASE}-${ARCH}
#							   if PYEASYINSTALL_ARCHDEP is defined.
#
# PYEASYINSTALL_CMD - Full file path to easy_install command.
#					  default: ${LOCALBASE}/bin/easy_install-${PYTHON_VER}
#
# PYEASYINSTALL_INSTALLARGS
#					- Arguments to easy_install command for egg installation.
#					  default: -q -N -S ${PYTHON_SITELIBDIR} ${PYDISTUTILS_PKGNAME}==${PYDISTUTILS_PKGVERSION}
#
# PYEASYINSTALL_UNINSTALLARGS
#					- Arguments to easy_install command for egg uninstallation.
#					  default: -q -m -S ${PYTHON_SITELIBDIR} ${PYDISTUTILS_PKGNAME}==${PYDISTUTILS_PKGVERSION}
#
# USE_TWISTED		- If this option is just yes then build and run
#					  the dependence to twistedCore is added. Alternatively
#					  here can be listed specific components of twisted
#					  framework, available components are: conch, lore,
#					  mail, names, news, runner, web, web2 and words.
#					  Note that core component is required for any of
#					  this optional components.
#
# USE_TWISTED_BUILD	- Same as previous but add only build dependency.
#
# USE_TWISTED_RUN	- Same as USE_TWISTED but add only run dependency.
#
# USE_ZOPE			- Use Zope - an object-based web application platform, this
#					  also sets up:
# SZOPEBASEDIR		- relative base directory of zope server
# ZOPEBASEDIR		- absolute base directory of zope that is
#					  ${LOCALBASE}/${SZOPEBASEDIR} by default,
# ZOPEPRODUCTDIR	- directory, where products for zope can be found
#
# ZOPE_VERSION		- Version of zope that will be used in the port. Set this
#					  in your /etc/make.conf in case you want to use a
#					  specific version of zope.
#

_PYTHON_PORTBRANCH=		2.7
_PYTHON_ALLBRANCHES=	2.7 2.6 3.3 3.2 3.1	# preferred first
_ZOPE_PORTBRANCH=		2.13
_ZOPE_ALLBRANCHES=		2.13


# Determine version number of Zope to use
.if defined(USE_ZOPE)
.if defined(ZOPE_VERSION)
_ZOPE_VERSION:=			${ZOPE_VERSION}
.else
_ZOPE_VERSION:=			${_ZOPE_PORTBRANCH}
.endif

# Validate Zope version whether it meets USE_ZOPE version restriction.
_ZOPE_VERSION_CHECK:=		${USE_ZOPE:C/^([1-9]\.[0-9]*)$/\1-\1/}
_ZOPE_VERSION_MINIMUM_TMP:=	${_ZOPE_VERSION_CHECK:C/([1-9]\.[0-9]*)[-+].*/\1/}
_ZOPE_VERSION_MINIMUM:=		${_ZOPE_VERSION_MINIMUM_TMP:M[1-9].[0-9]}
_ZOPE_VERSION_MAXIMUM_TMP:=	${_ZOPE_VERSION_CHECK:C/.*-([1-9]\.[0-9]*)/\1/}
_ZOPE_VERSION_MAXIMUM:=		${_ZOPE_VERSION_MAXIMUM_TMP:M[1-9].[0-9]}

.if !empty(_ZOPE_VERSION_MINIMUM) && ( \
		${_ZOPE_VERSION} < ${_ZOPE_VERSION_MINIMUM})
_ZOPE_VERSION_NONSUPPORTED=	${_ZOPE_VERSION_MINIMUM} at least
.elif !empty(_ZOPE_VERSION_MAXIMUM) && ( \
		${_ZOPE_VERSION} > ${_ZOPE_VERSION_MAXIMUM})
_ZOPE_VERSION_NONSUPPORTED=	${_ZOPE_VERSION_MAXIMUM} at most
.endif

# If we have an unsupported version of Zope, try another.
.if defined(_ZOPE_VERSION_NONSUPPORTED)
.if defined(ZOPE_VERSION)
IGNORE=				needs Zope ${_ZOPE_VERSION_NONSUPPORTED}.\
					But you specified ${_ZOPE_VERSION}
.else
.undef _ZOPE_VERSION
.for ver in ${_ZOPE_ALLBRANCHES}
__VER=		${ver}
.if !defined(_ZOPE_VERSION) && \
	!(!empty(_ZOPE_VERSION_MINIMUM) && ( \
		${__VER} < ${_ZOPE_VERSION_MINIMUM})) && \
	!(!empty(_ZOPE_VERSION_MAXIMUM) && ( \
		${__VER} > ${_ZOPE_VERSION_MAXIMUM}))
_ZOPE_VERSION=	${ver}
.endif
.endfor
.if !defined(_ZOPE_VERSION)
IGNORE=				needs an unsupported version of Zope
_ZOPE_VERSION=	${_ZOPE_PORTBRANCH} # just to avoid version sanity checking.
.endif
.endif	# defined(ZOPE_VERSION)
.endif	# defined(_ZOPE_VERSION_NONSUPPORTED)

ZOPE_VERSION?=	${_ZOPE_VERSION}

PYTHON_VERSION=	python2.7
.endif	# defined(USE_ZOPE)


# Determine version number of Python to use
.if !defined(PYTHON_DEFAULT_VERSION)
. if exists(${LOCALBASE}/bin/python) && !defined(PACKAGE_BUILDING)
_PYTHON_DEFAULT_VERSION!=	(${LOCALBASE}/bin/python -c \
							'import sys; print(sys.version[:3])' 2> /dev/null \
							|| ${ECHO_CMD} ${_PYTHON_PORTBRANCH}) | ${TAIL} -1
. else
_PYTHON_DEFAULT_VERSION=	${_PYTHON_PORTBRANCH}
. endif
PYTHON_DEFAULT_VERSION=		python${_PYTHON_DEFAULT_VERSION}
.endif

.if ${PYTHON_DEFAULT_VERSION:R} == "python3"
PYTHON3_DEFAULT_VERSION=	${PYTHON_DEFAULT_VERSION}
.else
PYTHON3_DEFAULT_VERSION=	python3.3
.endif

.if defined(PYTHON_VERSION)
_PYTHON_VERSION:=	${PYTHON_VERSION:S/^python//}
_PYTHON_CMD=		${LOCALBASE}/bin/${PYTHON_VERSION}
.else
_PYTHON_VERSION:=	${PYTHON_DEFAULT_VERSION:S/^python//}
_PYTHON_CMD=		${LOCALBASE}/bin/${PYTHON_DEFAULT_VERSION}
.endif

.if !defined(USE_PYTHON)
.if defined(USE_PYTHON_BUILD)
USE_PYTHON=		${USE_PYTHON_BUILD}
.elif defined(USE_PYTHON_RUN)
USE_PYTHON=		${USE_PYTHON_RUN}
.else
USE_PYTHON=		yes
.endif	# defined(USE_PYTHON_BUILD)
.else
USE_PYTHON_BUILD=	yes
USE_PYTHON_RUN=		yes
.endif	# !defined(USE_PYTHON)

# Validate Python version whether it meets USE_PYTHON version restriction.
_PYTHON_VERSION_CHECK:=			${USE_PYTHON:C/^([1-9]\.[0-9])$/\1-\1/}
_PYTHON_VERSION_MINIMUM_TMP:=	${_PYTHON_VERSION_CHECK:C/([1-9]\.[0-9])[-+].*/\1/}
_PYTHON_VERSION_MINIMUM:=		${_PYTHON_VERSION_MINIMUM_TMP:M[1-9].[0-9]}
_PYTHON_VERSION_MAXIMUM_TMP:=	${_PYTHON_VERSION_CHECK:C/.*-([1-9]\.[0-9])/\1/}
_PYTHON_VERSION_MAXIMUM:=		${_PYTHON_VERSION_MAXIMUM_TMP:M[1-9].[0-9]}

.if !empty(_PYTHON_VERSION_MINIMUM) && ( \
		${_PYTHON_VERSION} < ${_PYTHON_VERSION_MINIMUM})
_PYTHON_VERSION_NONSUPPORTED=	${_PYTHON_VERSION_MINIMUM} at least
.elif !empty(_PYTHON_VERSION_MAXIMUM) && ( \
		${_PYTHON_VERSION} > ${_PYTHON_VERSION_MAXIMUM})
_PYTHON_VERSION_NONSUPPORTED=	${_PYTHON_VERSION_MAXIMUM} at most
.endif

# If we have an unsupported version of Python, try another.
.if defined(_PYTHON_VERSION_NONSUPPORTED)
.if defined(PYTHON_VERSION) || defined(PYTHON_CMD)
IGNORE=				needs Python ${_PYTHON_VERSION_NONSUPPORTED}.\
					But you specified ${_PYTHON_VERSION}
.else
.undef _PYTHON_VERSION
.for ver in ${_PYTHON_ALLBRANCHES}
__VER=		${ver}
.if !defined(_PYTHON_VERSION) && \
	!(!empty(_PYTHON_VERSION_MINIMUM) && ( \
		${__VER} < ${_PYTHON_VERSION_MINIMUM})) && \
	!(!empty(_PYTHON_VERSION_MAXIMUM) && ( \
		${__VER} > ${_PYTHON_VERSION_MAXIMUM}))
_PYTHON_VERSION=	${ver}
_PYTHON_CMD=		${LOCALBASE}/bin/python${ver}
.endif
.endfor
.if !defined(_PYTHON_VERSION)
IGNORE=				needs an unsupported version of Python
_PYTHON_VERSION=	${_PYTHON_PORTBRANCH} # just to avoid version sanity checking.
.endif
.endif	# defined(PYTHON_VERSION) || defined(PYTHON_CMD)
.endif	# defined(_PYTHON_VERSION_NONSUPPORTED)

PYTHON_VERSION?=	python${_PYTHON_VERSION}
PYTHON_CMD?=		${_PYTHON_CMD}
.if !defined(PYTHONBASE)
PYTHONBASE!=		(${PYTHON_CMD} -c 'import sys; print(sys.prefix)' \
						2> /dev/null || ${ECHO_CMD} ${LOCALBASE}) | ${TAIL} -1
.endif
DEPENDS_ARGS+=		PYTHON_VERSION=${PYTHON_VERSION}

# We can only use the cached version if we are using the default python version.  Otherwise it
# should point to some other version we have installed, according to the port USE_PYTHON
# specification
.if !defined(PYTHON_DEFAULT_PORTVERSION) || (${PYTHON_VERSION} != ${PYTHON_DEFAULT_VERSION})
.if exists(${PYTHON_CMD})
_PYTHON_PORTVERSION!=	(${PYTHON_CMD} -c 'import sys; \
							print(sys.version.split()[0].replace("b",".b"))' 2> /dev/null) | ${TAIL} -1
.endif
.if !defined(PYTHON_NO_DEPENDS) && !empty(_PYTHON_PORTVERSION)
PYTHON_PORTVERSION=	${_PYTHON_PORTVERSION}
.endif
.elif defined(PYTHON_DEFAULT_PORTVERSION)
PYTHON_PORTVERSION=	${PYTHON_DEFAULT_PORTVERSION}
.endif

# Propagate the chosen python version to submakes.
.MAKEFLAGS:	PYTHON_VERSION=python${_PYTHON_VERSION}

# Python-3.3
.if ${PYTHON_VERSION} == "python3.3"
PYTHON_PORTVERSION?=	3.3.2
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python33
PYTHON_REL=		332
PYTHON_SUFFIX=		33
PYTHON_VER=		3.3
.if exists(${PYTHON_CMD}-config)
PYTHON_ABIVER!=		${PYTHON_CMD}-config --abiflags
.endif

# Python-3.2
.elif ${PYTHON_VERSION} == "python3.2"
PYTHON_PORTVERSION?=	3.2.5
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python32
PYTHON_REL=		325
PYTHON_SUFFIX=		32
PYTHON_VER=		3.2
.if exists(${PYTHON_CMD}-config)
PYTHON_ABIVER!=		${PYTHON_CMD}-config --abiflags
.endif

# Python-3.1
.elif ${PYTHON_VERSION} == "python3.1"
PYTHON_PORTVERSION?=	3.1.5
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python31
PYTHON_REL=		315
PYTHON_SUFFIX=		31
PYTHON_VER=		3.1

# Python-2.7
.elif ${PYTHON_VERSION} == "python2.7"
PYTHON_PORTVERSION?=	2.7.5
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python27
PYTHON_REL=		275
PYTHON_SUFFIX=		27
PYTHON_VER=		2.7

# Python-2.6
.elif ${PYTHON_VERSION} == "python2.6"
PYTHON_PORTVERSION?=	2.6.8
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python26
PYTHON_REL=		268
PYTHON_SUFFIX=		26
PYTHON_VER=		2.6

# Python versions in development
.elif defined(FORCE_PYTHON_VERSION)
PYTHON_PORTSDIR=	# empty
PYTHON_NO_DEPENDS=	YES
PYTHON_REL!=		${PYTHON_CMD} -c 'import sys; h = "%x" % sys.hexversion; \
						print(h[0]+h[2]+h[4])'
PYTHON_SUFFIX!=		${PYTHON_CMD} -c 'import sys; h = "%x" % sys.hexversion; \
						print(h[0]+h[2])'
PYTHON_VER!=		${PYTHON_CMD} -c 'import sys; print(sys.version[:3])'

.else
check-makevars::
	@${ECHO} "Makefile error: bad value for PYTHON_VERSION: ${PYTHON_VERSION}."
	@${ECHO} "Legal values are:"
	@${ECHO} "  python2.6"
	@${ECHO} "  python2.7 (default)"
	@${ECHO} "  python3.1"
	@${ECHO} "  python3.2"
	@${ECHO} "  python3.3"
	@${FALSE}
.endif

PYTHON_MAJOR_VER=	${PYTHON_VER:R}

PYTHON_MASTER_SITES=		${MASTER_SITE_PYTHON}
PYTHON_MASTER_SITE_SUBDIR=	ftp/python/${PYTHON_PORTVERSION:C/rc[0-9]//}
PYTHON_DISTFILE=		Python-${PYTHON_PORTVERSION:S/.rc/rc/}${EXTRACT_SUFX}
PYTHON_WRKSRC=				${WRKDIR}/Python-${PYTHON_PORTVERSION:S/.rc/rc/}

PYTHON_ABIVER?=			# empty
PYTHON_INCLUDEDIR=		${PYTHONBASE}/include/${PYTHON_VERSION}${PYTHON_ABIVER}
PYTHON_LIBDIR=			${PYTHONBASE}/lib/${PYTHON_VERSION}
PYTHON_PKGNAMEPREFIX=	py${PYTHON_SUFFIX}-
PYTHON_PKGNAMESUFFIX=	-py${PYTHON_SUFFIX}
PYTHON_PLATFORM=		${OPSYS:L}${OSREL:C/\.[0-9.]*//}
PYTHON_SITELIBDIR=		${PYTHON_LIBDIR}/site-packages

PYTHONPREFIX_INCLUDEDIR=	${PYTHON_INCLUDEDIR:S;${PYTHONBASE};${PREFIX};}
PYTHONPREFIX_LIBDIR=		${PYTHON_LIBDIR:S;${PYTHONBASE};${PREFIX};}
PYTHONPREFIX_SITELIBDIR=	${PYTHON_SITELIBDIR:S;${PYTHONBASE};${PREFIX};}

# setuptools support
.if defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} == "easy_install"
BUILD_DEPENDS+=		${PYEASYINSTALL_CMD}:${PORTSDIR}/devel/py-distribute
RUN_DEPENDS+=		${PYEASYINSTALL_CMD}:${PORTSDIR}/devel/py-distribute

PYDISTUTILS_BUILD_TARGET?=		bdist_egg
PYDISTUTILS_INSTALL_TARGET?=	easy_install
PYDISTUTILS_INSTALLARGS?=		-O 1 -N -S ${PYTHON_SITELIBDIR} \
								-d ${PYEASYINSTALL_SITELIBDIR} \
								-s ${PYEASYINSTALL_BINDIR} \
								${WRKSRC}/dist/${PYEASYINSTALL_EGG}
.if ${PREFIX} != ${LOCALBASE}
MAKE_ENV+=						PYTHONPATH=${PYEASYINSTALL_SITELIBDIR}
.endif

.if defined(PYEASYINSTALL_ARCHDEP)
.if !defined(_OSRELEASE)
_OSRELEASE!=					${UNAME} -r
.endif
PYEASYINSTALL_OSARCH?=			-${OPSYS:L}-${_OSRELEASE}-${ARCH}
.endif
PYEASYINSTALL_EGG?=				${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}${PYEASYINSTALL_OSARCH}.egg
PYEASYINSTALL_CMD?=				${LOCALBASE}/bin/easy_install-${PYTHON_VER}
PYEASYINSTALL_BINDIR?=			${PREFIX}/bin
PYEASYINSTALL_SITELIBDIR?=		${PYTHONPREFIX_SITELIBDIR}
PYEASYINSTALL_INSTALLARGS?=		-q -N -S ${PYTHON_SITELIBDIR} \
								-d ${PYEASYINSTALL_SITELIBDIR} \
								-s ${PYEASYINSTALL_BINDIR} \
								${PYDISTUTILS_PKGNAME}==${PYDISTUTILS_PKGVERSION}
PYEASYINSTALL_UNINSTALLARGS?=	-q -N -m -S ${PYTHON_SITELIBDIR} \
								-d ${PYEASYINSTALL_SITELIBDIR} \
								-s ${PYEASYINSTALL_BINDIR} \
								${PYDISTUTILS_PKGNAME}==${PYDISTUTILS_PKGVERSION}

PLIST_SUB+=		PYEASYINSTALL_EGG=${PYEASYINSTALL_EGG}

pre-install: pre-install-easyinstall
pre-install-easyinstall:
	@${MKDIR} ${PYEASYINSTALL_SITELIBDIR}

add-plist-post: add-plist-easyinstall
add-plist-easyinstall:
	@# @unexec line must be located before any other line while @exec must not.
	@${CAT} ${TMPPLIST} > ${TMPPLIST}.pei_tmp
	@${ECHO_CMD} "@unexec ${PYEASYINSTALL_CMD} ${PYEASYINSTALL_UNINSTALLARGS}" \
		> ${TMPPLIST}
	@${CAT} ${TMPPLIST}.pei_tmp >> ${TMPPLIST}
	@${ECHO_CMD} "@exec ${SETENV} PYTHONPATH=${PYEASYINSTALL_SITELIBDIR} \
		${PYEASYINSTALL_CMD} ${PYEASYINSTALL_INSTALLARGS}" \
		>> ${TMPPLIST}
.endif		# defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} == "easy_install"

# distutils support
PYSETUP?=				setup.py
PYDISTUTILS_CONFIGUREARGS?=
PYDISTUTILS_BUILDARGS?=
PYDISTUTILS_INSTALLARGS?=	-c -O1 --prefix=${PREFIX}
PYDISTUTILS_PKGNAME?=	${PORTNAME}
PYDISTUTILS_PKGVERSION?=${PORTVERSION}
PYDISTUTILS_EGGINFO?=	${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}.egg-info
PYDISTUTILS_EGGINFODIR?=${PYTHONPREFIX_SITELIBDIR}

.if !defined(PYDISTUTILS_NOEGGINFO) && \
	(defined(INSTALLS_EGGINFO) ||	\
		(defined(USE_PYDISTUTILS) && \
		 ${USE_PYDISTUTILS} != "easy_install")) && \
	 defined(PYTHON_REL)
. for egg in ${PYDISTUTILS_EGGINFO}
PLIST_FILES+=	${PYDISTUTILS_EGGINFODIR:S;${PREFIX}/;;}/${egg}
. endfor
.endif

# Fix for programs that build python from a GNU auto* environment
CONFIGURE_ENV+=	PYTHON="${PYTHON_CMD}"

# Zope-related variables
.if defined(USE_ZOPE)
.if ${ZOPE_VERSION} == "2.13"
ZOPE_DEPENDS=	zope213>0:${PORTSDIR}/www/zope213
.else
check-makevars::
	@${ECHO} "Makefile error: bad value for ZOPE_VERSION: ${ZOPE_VERSION}."
	@${ECHO} "Legal values are: 2.13 (default)"
	@${FALSE}
.endif
ZOPEBASEDIR?=			${PREFIX}/${SZOPEBASEDIR}
ZOPEPRODUCTDIR?=		Products
.endif

# Python 3rd-party modules
PYGAME=			${PYTHON_PKGNAMEPREFIX}game>0:${PORTSDIR}/devel/py-game
PYNUMERIC=		${PYTHON_SITELIBDIR}/Numeric/Numeric.py:${PORTSDIR}/math/py-numeric
PYNUMPY=		${PYTHON_SITELIBDIR}/numpy/core/numeric.py:${PORTSDIR}/math/py-numpy
PYXML=			${PYTHON_SITELIBDIR}/_xmlplus/__init__.py:${PORTSDIR}/textproc/py-xml

# dependencies
PYTHON_NO_DEPENDS?=		NO

.if ${PYTHON_NO_DEPENDS} == "NO"
.if defined(USE_PYTHON_BUILD)
BUILD_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}
.endif
.if defined(USE_PYTHON_RUN)
RUN_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}
.endif
.endif		# ${PYTHON_NO_DEPENDS} == "NO"

.if defined(USE_ZOPE)
RUN_DEPENDS+=	${ZOPE_DEPENDS}
.endif

# set $PREFIX as Python's one
.if defined(USE_PYTHON_PREFIX)
PREFIX=			${PYTHONBASE}
.endif

# Substitutions for pkg-plist
# Use a short form of the PYTHONPREFIX_*DIR variables; we don't need the
# base directory in the plist file.
PLIST_SUB+=		PYTHON_INCLUDEDIR=${PYTHONPREFIX_INCLUDEDIR:S;${PREFIX}/;;} \
				PYTHON_LIBDIR=${PYTHONPREFIX_LIBDIR:S;${PREFIX}/;;} \
				PYTHON_PLATFORM=${PYTHON_PLATFORM} \
				PYTHON_SITELIBDIR=${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;} \
				PYTHON_VERSION=${PYTHON_VERSION}

# Zope specific substitutions
.if defined(USE_ZOPE)
PLIST_SUB+=		ZOPEBASEDIR=${SZOPEBASEDIR} \
				ZOPEPRODUCTDIR=${SZOPEBASEDIR}/${ZOPEPRODUCTDIR}
.endif

# Twisted specific routines
.if defined(USE_TWISTED) || defined(USE_TWISTED_BUILD) || defined(USE_TWISTED_RUN)

.if defined(USE_TWISTED_BUILD) && defined(USE_TWISTED_RUN)
. if ${USE_TWISTED_BUILD} != ${USE_TWISTED_RUN}
IGNORE=	: USE_TWISTED_BUILD and USE_TWISTED_RUN must have equal values
. endif
.endif

.if defined(USE_TWISTED)
TWISTED_BUILD_DEP=	yes
TWISTED_RUN_DEP=	yes
.else
. if defined(USE_TWISTED_BUILD)
TWISTED_BUILD_DEP=	yes
USE_TWISTED=		${USE_TWISTED_BUILD}
. endif
. if defined(USE_TWISTED_RUN)
TWISTED_RUN_DEP=	yes
USE_TWISTED=		${USE_TWISTED_RUN}
. endif
.endif

.if ${USE_TWISTED} == "20" || ${USE_TWISTED} == "yes"
USE_TWISTED_VER=	${USE_TWISTED}
. if defined(TWISTED_BUILD_DEP)
BUILD_DEPENDS+=		${PYTHON_SITELIBDIR}/twisted/__init__.py:${PORTSDIR}/devel/py-twistedCore
. endif
. if defined(TWISTED_RUN_DEP)
RUN_DEPENDS+=		${PYTHON_SITELIBDIR}/twisted/__init__.py:${PORTSDIR}/devel/py-twistedCore
. endif
.else
USE_TWISTED_VER=	20
# Checking for twisted components
_TWISTED_COMPONENTS?=	conch lore mail names news runner web web2 words

# XXX Should be here other dependencies types?
conch_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/conch/__init__.py:${PORTSDIR}/security/py-twistedConch
lore_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/lore/__init__.py:${PORTSDIR}/textproc/py-twistedLore
mail_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/mail/__init__.py:${PORTSDIR}/mail/py-twistedMail
names_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/names/__init__.py:${PORTSDIR}/dns/py-twistedNames
news_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/news/__init__.py:${PORTSDIR}/news/py-twistedNews
pair_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/pair/__init__.py:${PORTSDIR}/net/py-twistedPair
runner_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/runner/__init__.py:${PORTSDIR}/devel/py-twistedRunner
web2_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/web2/__init__.py:${PORTSDIR}/www/py-twistedWeb2
web_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/web/__init__.py:${PORTSDIR}/www/py-twistedWeb
words_DEPENDS=	${PYTHON_SITELIBDIR}/twisted/words/__init__.py:${PORTSDIR}/net-im/py-twistedWords

.for component in ${_TWISTED_COMPONENTS}
_COMP_TEST=	${USE_TWISTED:M${component}}
. if ${_COMP_TEST:S/${component}//}!=${_COMP_TEST:S/  / /g}
.  if defined(TWISTED_BUILD_DEP)
BUILD_DEPENDS+=	${${component}_DEPENDS}
.  endif
.  if defined(TWISTED_RUN_DEP)
RUN_DEPENDS+=	${${component}_DEPENDS}
.  endif
. endif
.endfor

# Implicit dependency from core
.if defined(TWISTED_BUILD_DEP)
BUILD_DEPENDS+=	${PYTHON_SITELIBDIR}/twisted/__init__.py:${PORTSDIR}/devel/py-twistedCore
.endif
.if defined(TWISTED_RUN_DEP)
RUN_DEPENDS+=	${PYTHON_SITELIBDIR}/twisted/__init__.py:${PORTSDIR}/devel/py-twistedCore
.endif

.endif

.endif # defined(USE_TWISTED)

# XXX Hm, should I export some of the variables above to *_ENV?

# If multiple Python versions are installed and cmake is used, it might
# happen that a cmake-enabled port using find_package(PythonLibs) and
# find_package(PythonInterp) detects different Python versions.
# This in turn might cause it to link against version X while using the
# includes of version Y, leading to a broken port.
# Enforce a certain Python version by using PYTHON_VER for cmake.

CMAKE_ARGS+=	-DPythonLibs_FIND_VERSION:STRING="${PYTHON_VER}" \
		-DPythonInterp_FIND_VERSION:STRING="${PYTHON_VER}"

.endif		# !defined(_POSTMKINCLUDED) && !defined(Python_Pre_Include)

.if defined(_POSTMKINCLUDED) && !defined(Python_Post_Include)

Python_Post_Include=			python.mk

# don't check precompiled python code.
SKIP_FAKE_CHECK?=.*\.py[co]


# py-distutils support
PYDISTUTILS_CONFIGURE_TARGET?=	config
PYDISTUTILS_BUILD_TARGET?=		build
PYDISTUTILS_INSTALL_TARGET?=	install

.if defined(USE_PYDISTUTILS)
LDSHARED?=	${CC} -shared
MAKE_ENV+=	LDSHARED="${LDSHARED}" PYTHONDONTWRITEBYTECODE= PYTHONOPTIMIZE=

.if !target(do-configure) && !defined(HAS_CONFIGURE) && !defined(GNU_CONFIGURE)
do-configure:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_CONFIGURE_TARGET} ${PYDISTUTILS_CONFIGUREARGS})
.endif

.if !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_BUILD_TARGET} ${PYDISTUTILS_BUILDARGS})
.endif

.if !target(do-install)
do-install:
	@(cd ${INSTALL_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_INSTALL_TARGET} ${PYDISTUTILS_INSTALLARGS})
.endif

.if defined(PYEASYINSTALL_ARCHDEP)
.if !target(easyinstall-setopt)
easyinstall-setopt:
	@(cd ${BUILD_WRKSRC}; \
		${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} setopt -c build -o build-platlib -s lib.${PYEASYINSTALL_OSARCH:S/^-//}; \
		${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} setopt -c build -o build-temp -s temp.${PYEASYINSTALL_OSARCH:S/^-//}-${PYTHON_VER}; \
		${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} setopt -c bdist_egg -o plat-name -s ${PYEASYINSTALL_OSARCH:S/^-//}; \
		${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYSETUP} setopt -c bdist -o plat-name -s ${PYEASYINSTALL_OSARCH:S/^-//})
.endif		# !target(eayinstall-setopt)

pre-build: easyinstall-setopt
.endif		# defined(PYEASYINSTALL_ARCHDEP)
.endif		# defined(USE_PYDISTUTILS)

.endif		# defined(_POSTMKINCLUDED) && !defined(Python_Post_Include)
