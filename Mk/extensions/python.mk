# $MidnightBSD$

.if !defined(_POSTMKINCLUDED) && !defined(Python_Pre_Include)

Python_Pre_Include=		python.mk
Python_Include_MAINTAINER=	ports@MidnightBSD.org

# This file contains some variable definitions that are supposed to
# make your life easier when dealing with ports related to the Python
# language. It's automatically included when USE_PYTHON is defined in
# the ports' makefile. If your port requires only some set of Python
# versions, you can define USE_PYTHON as [min]-[max] or min+ or -max
# or as an explicit version or as a meta port version (eg. 3.1-3.2
# for [min]-[max], 2.7+ or -3.2 for min+ and -max, 2.7 for an
# explicit version or 3 for a meta port version).
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
#					  extensions like bsddb, gdbm, sqlite3 and tkinter, which
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
# PYTHON_VER		- Version of the python binary in your ${PATH}, in the
#					  format "2.7".
#
# PYTHON_DEFAULT_VERSION
#					- Version of the default python binary in your ${PATH}, in
#					  the format "python2.7".
#
# PYTHON2_DEFAULT_VERSION
#					- Version of the default python2 binary in your ${PATH}, in
#					  the format "python2.7".
#
# PYTHON3_DEFAULT_VERSION
#					- Version of the default python3 binary in your ${PATH}, in
#					  the format "python3.2".
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
# PYDISTUTILS_AUTOPLIST
#					- Automatically generates the packaging list for a port that uses
#                                         distutils or setuptools (easy_install) when defined.
#                                         requires: USE_PYDISTUTILS
#
# PYTHON_PY3K_PLIST_HACK
#					- Automatically generates Python 3.x compatible __pycache__ entries
#                                         from a Python 2.x packaging list when defined. Use this for ports that
#                                         do *not* use standard Python packaging mechanisms such as distutils
#                                         or setuptools, and support *both* Python 2.x and 3.x. Not needed when
#                                         PYDISTUTILS_AUTOPLIST is defined.
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
#					  default: -${OPSYS:tl}-${OSVERSION:C/([0-9]*)[0-9]{5}/\1/}-${ARCH}
#							   if PYEASYINSTALL_ARCHDEP is defined.
#
# PYEASYINSTALL_CMD - Full file path to easy_install command.
#					  default: ${LOCALBASE}/bin/easy_install-${PYTHON_VER}

_PYTHON_PORTBRANCH=		2.7
_PYTHON_ALLBRANCHES=	2.7 3.4 3.3 # preferred first

# Determine version number of Python to use
.include "${PORTSDIR}/Mk/components/default-versions.mk"

.if defined(PYTHON_DEFAULT_VERSION)
WARNING+=	"PYTHON_DEFAULT_VERSION is defined, consider using DEFAULT_VERSIONS=python=${PYTHON_DEFAULT_VERSION:S/^python//} instead"
.endif
.if defined(PYTHON2_DEFAULT_VERSION)
WARNING+=	"PYTHON2_DEFAULT_VERSION is defined, consider using DEFAULT_VERSIONS=python2=${PYTHON2_DEFAULT_VERSION:S/^python//} instead"
.endif
.if defined(PYTHON3_DEFAULT_VERSION)
WARNING+=	"PYTHON3_DEFAULT_VERSION is defined, consider using DEFAULT_VERSIONS=python3=${PYTHON3_DEFAULT_VERSION:S/^python//} instead"
.endif

.if exists(${LOCALBASE}/bin/python)
_PYTHON_DEFAULT_VERSION!=	(${LOCALBASE}/bin/python -c \
							'import sys; print(sys.version[:3])' 2> /dev/null \
							|| ${ECHO_CMD} ${_PYTHON_PORTBRANCH}) | ${TAIL} -1
.if defined(PYTHON_DEFAULT) && (${PYTHON_DEFAULT} != ${_PYTHON_DEFAULT_VERSION})
WARNING+=	"Your requested default python version ${PYTHON_DEFAULT} is different from the installed default python interpreter version ${_PYTHON_DEFAULT_VERSION}"
.endif
PYTHON_DEFAULT_VERSION=		python${_PYTHON_DEFAULT_VERSION}
.else
PYTHON_DEFAULT_VERSION=		python${PYTHON_DEFAULT}
.endif # exists(${LOCALBASE}/bin/python)

# Is only a meta-port version defined?
.if ${PYTHON_DEFAULT_VERSION} == "python2"
PYTHON2_DEFAULT_VERSION?=	python${PYTHON2_DEFAULT}
.elif ${PYTHON_DEFAULT_VERSION:R} == "python2"
PYTHON2_DEFAULT_VERSION=	${PYTHON_DEFAULT_VERSION}
.else
PYTHON2_DEFAULT_VERSION?=	python${PYTHON2_DEFAULT}
.endif

.if ${PYTHON_DEFAULT_VERSION} == "python3"
PYTHON3_DEFAULT_VERSION?=	python${PYTHON3_DEFAULT}
.elif ${PYTHON_DEFAULT_VERSION:R} == "python3"
 PYTHON3_DEFAULT_VERSION=	${PYTHON_DEFAULT_VERSION}
.else
PYTHON3_DEFAULT_VERSION?=	python${PYTHON3_DEFAULT}
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

.if ${USE_PYTHON} == "2"
USE_PYTHON=			${PYTHON2_DEFAULT_VERSION:S/^python//}
_WANTS_META_PORT=	2
.elif ${USE_PYTHON} == "3"
USE_PYTHON=			${PYTHON3_DEFAULT_VERSION:S/^python//}
_WANTS_META_PORT=	3
.endif  # ${USE_PYTHON} == "2"

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

# Python-3.4
.if ${PYTHON_VERSION} == "python3.4"
PYTHON_PORTVERSION?=    3.4.1
PYTHON_PORTSDIR=        ${PORTSDIR}/lang/python34
PYTHON_REL=             341
PYTHON_SUFFIX=          34
PYTHON_VER=             3.4
.if exists(${PYTHON_CMD}-config) && defined(PORTNAME) && ${PORTNAME} != python34
PYTHON_ABIVER!=         ${PYTHON_CMD}-config --abiflags
.endif

# Python-3.3
.elif ${PYTHON_VERSION} == "python3.3"
PYTHON_PORTVERSION?=	3.3.5
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python33
PYTHON_REL=		335
PYTHON_SUFFIX=		33
PYTHON_VER=		3.3
.if exists(${PYTHON_CMD}-config) && defined(PORTNAME) && ${PORTNAME} != python33
PYTHON_ABIVER!=		${PYTHON_CMD}-config --abiflags
.endif

# Python-3.2
.elif ${PYTHON_VERSION} == "python3.2"
PYTHON_PORTVERSION?=	3.2.5
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python32
PYTHON_REL=		325
PYTHON_SUFFIX=		32
PYTHON_VER=		3.2
.if exists(${PYTHON_CMD}-config) && defined(PORTNAME) && ${PORTNAME} != python32
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
PYTHON_PORTVERSION?=	2.7.8
PYTHON_PORTSDIR=	${PORTSDIR}/lang/python27
PYTHON_REL=		278
PYTHON_SUFFIX=		27
PYTHON_VER=		2.7

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
PYTHON_PLATFORM=		${OPSYS:tl}${OSREL:C/\.[0-9.]*//}
PYTHON_SITELIBDIR=		${PYTHON_LIBDIR}/site-packages

PYTHONPREFIX_INCLUDEDIR=	${PYTHON_INCLUDEDIR:S;${PYTHONBASE};${TRUE_PREFIX};}
PYTHONPREFIX_LIBDIR=		${PYTHON_LIBDIR:S;${PYTHONBASE};${TRUE_PREFIX};}
PYTHONPREFIX_SITELIBDIR=	${PYTHON_SITELIBDIR:S;${PYTHONBASE};${TRUE_PREFIX};}

_CURRENTPORT:=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
.if defined(USE_PYDISTUTILS) && ${_CURRENTPORT:S/${PYTHON_SUFFIX}$//} != ${PYTHON_PKGNAMEPREFIX}setuptools
BUILD_DEPENDS+=		${PYTHON_PKGNAMEPREFIX}setuptools${PYTHON_SUFFIX}>0:${PORTSDIR}/devel/py-setuptools${PYTHON_SUFFIX}
RUN_DEPENDS+=		${PYTHON_PKGNAMEPREFIX}setuptools${PYTHON_SUFFIX}>0:${PORTSDIR}/devel/py-setuptools${PYTHON_SUFFIX}
.endif

# setuptools support
.if defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} == "easy_install"

PYDISTUTILS_BUILD_TARGET?=		bdist_egg
PYDISTUTILS_INSTALL_TARGET?=	easy_install
PYDISTUTILS_INSTALLARGS?=		-O 1 -N -S ${PYTHON_SITELIBDIR} \
								-d ${PYEASYINSTALL_SITELIBDIR} \
								-s ${PYEASYINSTALL_BINDIR} \
								${WRKSRC}/dist/${PYEASYINSTALL_EGG}
.if !defined(NO_STAGE)
MAKE_ENV+=			PYTHONUSERBASE=${FAKE_DESTDIR}${PYTHONBASE}
PYDISTUTILS_INSTALLARGS:=	-m -q --user ${PYDISTUTILS_INSTALLARGS}
.endif

.if ${TRUE_PREFIX} != ${LOCALBASE} || !defined(NO_STAGE)
MAKE_ENV+=						PYTHONPATH=${PYEASYINSTALL_SITELIBDIR}
.endif

.if defined(PYEASYINSTALL_ARCHDEP)
PYEASYINSTALL_OSARCH?=			-${OPSYS:tl}-${OSVERSION:C/([0-9]*)[0-9]{5}/\1/}-${ARCH}
MAKE_ENV+=						_PYTHON_HOST_PLATFORM=${PYEASYINSTALL_OSARCH}
.endif
PYEASYINSTALL_EGG?=				${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}${PYEASYINSTALL_OSARCH}.egg
PYEASYINSTALL_CMD?=				${LOCALBASE}/bin/easy_install-${PYTHON_VER}
PYEASYINSTALL_BINDIR?=			${TRUE_PREFIX}/bin
PYEASYINSTALL_SITELIBDIR?=		${PYTHONPREFIX_SITELIBDIR}

PLIST_SUB+=		PYEASYINSTALL_EGG=${PYEASYINSTALL_EGG}

pre-install: pre-install-easyinstall
pre-install-easyinstall:
.if defined(NO_STAGE)
	@${MKDIR} ${PYEASYINSTALL_SITELIBDIR}
.else
	@${MKDIR} ${FAKE_DESTDIR}${PYEASYINSTALL_SITELIBDIR}
.endif

add-plist-post: add-plist-easyinstall
add-plist-easyinstall:
	@# Easiest to fake pyeasyinstall, or it complains about paths
	@${ECHO_CMD} "@unexec ${REINPLACE_CMD} -i '' \
			-e '\,^\./${PYEASYINSTALL_EGG}$$,d' \
			${PYEASYINSTALL_SITELIBDIR}/easy-install.pth" \
		>> ${TMPPLIST}
	@${ECHO_CMD} "@exec ${PRINTF} '1a\n./${PYEASYINSTALL_EGG}\n.\nw\nq\n' | \
			/bin/ed ${PYEASYINSTALL_SITELIBDIR}/easy-install.pth" \
		>> ${TMPPLIST}

.if !defined(NO_STAGE)
.if !target(stage-python-compileall)
stage-python-compileall:
	(cd ${FAKE_DESTDIR}${TRUE_PREFIX} && \
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;} && \
	${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;})
.endif

post-install: stage-python-compileall
.endif

.endif		# defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} == "easy_install"

# distutils support
PYSETUP?=				setup.py
PYDISTUTILS_SETUP?=	-c "import setuptools; __file__='${PYSETUP}'; exec(compile(open(__file__).read().replace('\\r\\n', '\\n'), __file__, 'exec'))"
PYDISTUTILS_CONFIGUREARGS?=
PYDISTUTILS_BUILDARGS?=
PYDISTUTILS_INSTALLARGS?=	-c -O1 --prefix=${TRUE_PREFIX}
.if defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} != "easy_install"
. if !defined(PYDISTUTILS_INSTALLNOSINGLE)
PYDISTUTILS_INSTALLARGS+=	--single-version-externally-managed
. endif
. if !defined(NO_STAGE)
PYDISTUTILS_INSTALLARGS+=	--root=${FAKE_DESTDIR}
. endif
.endif
_PYTHONPKGLIST=				${WRKDIR}/.PLIST.pymodtmp
PYDISTUTILS_INSTALLARGS:=	--record ${_PYTHONPKGLIST} \
		${PYDISTUTILS_INSTALLARGS}

PYDISTUTILS_PKGNAME?=	${PORTNAME}
PYDISTUTILS_PKGVERSION?=${PORTVERSION}
PYDISTUTILS_EGGINFO?=	${PYDISTUTILS_PKGNAME:C/[^A-Za-z0-9.]+/_/g}-${PYDISTUTILS_PKGVERSION:C/[^A-Za-z0-9.]+/_/g}-py${PYTHON_VER}.egg-info
PYDISTUTILS_EGGINFODIR?=${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}

add-plist-egginfo:
.if !defined(PYDISTUTILS_NOEGGINFO) && \
	!defined(PYDISTUTILS_AUTOPLIST) && \
	(defined(INSTALLS_EGGINFO) ||	\
		(defined(USE_PYDISTUTILS) && \
		 ${USE_PYDISTUTILS} != "easy_install")) && \
	 defined(PYTHON_REL)
. for egginfo in ${PYDISTUTILS_EGGINFO}
	if [ -d "${PYDISTUTILS_EGGINFODIR}/${egginfo}" ]; then \
		${LS} ${PYDISTUTILS_EGGINFODIR}/${egginfo} | while read f; do \
			${ECHO_CMD} ${PYDISTUTILS_EGGINFODIR:S;^${FAKE_DESTDIR}${PYTHONBASE}/;;}/${egginfo}/$${f} >> ${TMPPLIST}; \
		done; \
		${ECHO_CMD} "@unexec rmdir \"%D/${PYDISTUTILS_EGGINFODIR:S;${FAKE_DESTDIR}${PYTHONBASE}/;;}/${egginfo}\" 2>/dev/null || true" >> ${TMPPLIST}; \
	fi;
. endfor
.else
	@${DO_NADA}
.endif

.if defined(PYDISTUTILS_AUTOPLIST) && defined(USE_PYDISTUTILS)
_RELSITELIBDIR=	${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
_RELLIBDIR=		${PYTHONPREFIX_LIBDIR:S;${TRUE_PREFIX}/;;}

add-plist-post:	add-plist-pymod
add-plist-pymod:
	@{ ${ECHO_CMD} "#mtree"; ${CAT} ${MTREE_FILE}; } | ${TAR} tf - | \
		${SED} '/^\.$$/d' > ${WRKDIR}/.localmtree
	@${ECHO_CMD} "${_RELSITELIBDIR}" >> ${WRKDIR}/.localmtree
	@${ECHO_CMD} "${_RELLIBDIR}" >> ${WRKDIR}/.localmtree
	@${SED} -e 's|^${FAKE_DESTDIR}${TRUE_PREFIX}/||' \
		-e 's|^${TRUE_PREFIX}/||' \
		-e 's|^\(man/man[0-9]\)/\(.*\.[0-9]\)$$|\1/\2${MANEXT}|' \
		${_PYTHONPKGLIST} | ${SORT} >> ${TMPPLIST}
	@${SED} -e 's|^${FAKE_DESTDIR}${TRUE_PREFIX}/\(.*\)/\(.*\)|\1|' \
		-e 's|^${TRUE_PREFIX}/\(.*\)/\(.*\)|\1|' ${_PYTHONPKGLIST} | \
		${AWK} '{ num = split($$0, a, "/"); res=""; \
					for(i = 1; i <= num; ++i) { \
						if (i == 1) res = a[i]; \
						else res = res "/" a[i]; \
						print res; \
					} \
				}' | \
		while read line; do \
			${GREP} -qw "^$${line}$$" ${WRKDIR}/.localmtree || { \
				[ -n "$${line}" ] && \
				${ECHO_CMD} "@unexec rmdir \"%D/$${line}\" 2>/dev/null || true"; \
			}; \
		done | ${SORT} | uniq | ${SORT} -r >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir \"%D/${PYTHON_SITELIBDIR:S;${PYTHONBASE}/;;}\" 2>/dev/null || true" >> ${TMPPLIST}
	@${ECHO_CMD} "@unexec rmdir \"%D/${PYTHON_LIBDIR:S;${PYTHONBASE}/;;}\" 2>/dev/null || true" >> ${TMPPLIST}

.else
.if ${PYTHON_REL} >= 330 && defined(PYTHON_PY3K_PLIST_HACK)
# When Python version is 3.2+ we rewrite all the filenames
# of TMPPLIST that end with .py[co], so that they conform
# to PEP 3147 (see http://www.python.org/dev/peps/pep-3147/)
PYMAGICTAG=		${PYTHON_CMD} -c 'import imp; print(imp.get_tag())'
add-plist-post:
	@${AWK} '\
		/\.py[co]$$/ && !($$0 ~ "/" pc "/") {id = match($$0, /\/[^\/]+\.py[co]$$/); if (id != 0) {d = substr($$0, 1, RSTART - 1); dirs[d] = 1}; sub(/\.py[co]$$/,  "." mt "&"); sub(/[^\/]+\.py[co]$$/, pc "/&"); print; next} \
		/^@dirrm / {d = substr($$0, 8); if (d in dirs) {print $$0 "/" pc}; print $$0; next} \
		{print} \
		END {if (sp in dirs) {print "@dirrm " sp "/" pc}} \
		' \
		pc="__pycache__" mt="$$(${PYMAGICTAG})" sp="${PYTHON_SITELIBDIR:S,${PYTHONBASE}/,,g}" \
		${TMPPLIST} > ${TMPPLIST}.pyc_tmp
	@${MV} ${TMPPLIST}.pyc_tmp ${TMPPLIST}
.endif # ${PYTHON_REL} >= 330 && defined(PYTHON_PY3K_PLIST_HACK)
.endif # defined(PYDISTUTILS_AUTOPLIST) && defined(USE_PYDISTUTILS)

# Fix for programs that build python from a GNU auto* environment
CONFIGURE_ENV+=	PYTHON="${PYTHON_CMD}"

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
.if defined(_WANTS_META_PORT)
BUILD_DEPENDS+=	python${_WANTS_META_PORT}:${PORTSDIR}/lang/python${_WANTS_META_PORT}
.endif
.endif
.if defined(USE_PYTHON_RUN)
RUN_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}
.if defined(_WANTS_META_PORT)
RUN_DEPENDS+=	python${_WANTS_META_PORT}:${PORTSDIR}/lang/python${_WANTS_META_PORT}
.endif
.endif
.endif		# ${PYTHON_NO_DEPENDS} == "NO"

# set $PREFIX as Python's one
.if defined(USE_PYTHON_PREFIX)
PREFIX=			${PYTHONBASE}
.endif

# Substitutions for pkg-plist
# Use a short form of the PYTHONPREFIX_*DIR variables; we don't need the
# base directory in the plist file.
PLIST_SUB+=		PYTHON_INCLUDEDIR=${PYTHONPREFIX_INCLUDEDIR:S;${TRUE_PREFIX}/;;} \
				PYTHON_LIBDIR=${PYTHONPREFIX_LIBDIR:S;${TRUE_PREFIX}/;;} \
				PYTHON_PLATFORM=${PYTHON_PLATFORM} \
				PYTHON_SITELIBDIR=${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;} \
				PYTHON_VERSION=${PYTHON_VERSION}

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

Python_Post_Include=			bsd.python.mk

# py-distutils support
PYDISTUTILS_CONFIGURE_TARGET?=	config
PYDISTUTILS_BUILD_TARGET?=		build
PYDISTUTILS_INSTALL_TARGET?=	install

.if defined(USE_PYDISTUTILS)
LDSHARED?=	${CC} -shared
MAKE_ENV+=	LDSHARED="${LDSHARED}" PYTHONDONTWRITEBYTECODE= PYTHONOPTIMIZE=

.if !target(do-configure) && !defined(HAS_CONFIGURE) && !defined(GNU_CONFIGURE)
do-configure:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} ${PYDISTUTILS_CONFIGURE_TARGET} ${PYDISTUTILS_CONFIGUREARGS})
.endif

.if !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} ${PYDISTUTILS_BUILD_TARGET} ${PYDISTUTILS_BUILDARGS})
.endif

.if !target(do-install)
do-install:
	@(cd ${INSTALL_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PYTHON_CMD} ${PYDISTUTILS_SETUP} ${PYDISTUTILS_INSTALL_TARGET} ${PYDISTUTILS_INSTALLARGS})
.endif

add-plist-post: add-plist-egginfo

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
