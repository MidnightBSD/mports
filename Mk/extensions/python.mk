# $MidnightBSD$
#
# Provide support for Python related ports. This includes detecting Python
# interpreters, ports providing package and modules for python as well as
# consumer ports requiring Python at build or run time.
#
# Feature:	python
# Usage:	USES=python or USES=python:args
# Valid ARGS:	<version>, build, run
#

# MAINTAINER: ports@MidnightBSD.org

.if !defined(_INCLUDE_USES_PYTHON_MK)
_INCLUDE_USES_PYTHON_MK=	yes

# What Python version and what Python interpreters are currently supported?
_PYTHON_VERSIONS=		2.7 3.4 3.3     # preferred first
_PYTHON_PORTBRANCH=		2.7		# ${_PYTHON_VERSIONS:[1]}
_PYTHON_BASECMD=		${LOCALBASE}/bin/python
_PYTHON_RELPORTDIR=		${PORTSDIR}/lang/python

# Make each individual feature available as _PYTHON_FEATURE_<FEATURENAME>
.for var in ${USE_PYTHON}
_PYTHON_FEATURE_${var:tu}=	yes
.endfor

# Make sure that no dependency or some other environment variable
# pollutes the build/run dependency detection
.undef _PYTHON_BUILD_DEP
.undef _PYTHON_RUN_DEP
_PYTHON_ARGS=		${python_ARGS:S/,/ /g}
.if ${_PYTHON_ARGS:Mbuild}
_PYTHON_BUILD_DEP=	yes
_PYTHON_ARGS:=		${_PYTHON_ARGS:Nbuild}
.endif
.if ${_PYTHON_ARGS:Mrun}
_PYTHON_RUN_DEP=	yes
_PYTHON_ARGS:=		${_PYTHON_ARGS:Nrun}
.endif

# The port does not specify a build or run dependency, assume both are
# required.
.if !defined(_PYTHON_BUILD_DEP) && !defined(_PYTHON_RUN_DEP) && \
    !defined(PYTHON_NO_DEPENDS)
_PYTHON_BUILD_DEP=	yes
_PYTHON_RUN_DEP=	yes
.endif

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
		'import sys; print("%d.%d" % sys.version_info[:2])' 2> /dev/null \
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

.if ${_PYTHON_ARGS} == "2"
_PYTHON_ARGS=		${PYTHON2_DEFAULT_VERSION:S/^python//}
_WANTS_META_PORT=	2
.elif ${_PYTHON_ARGS} == "3"
_PYTHON_ARGS=		${PYTHON3_DEFAULT_VERSION:S/^python//}
_WANTS_META_PORT=	3
.endif  # ${_PYTHON_ARGS} == "2"

.if defined(PYTHON_VERSION)
_PYTHON_VERSION:=	${PYTHON_VERSION:S/^python//}
_PYTHON_CMD=		${LOCALBASE}/bin/${PYTHON_VERSION}
.else
_PYTHON_VERSION:=	${PYTHON_DEFAULT_VERSION:S/^python//}
_PYTHON_CMD=		${LOCALBASE}/bin/${PYTHON_DEFAULT_VERSION}
.endif # defined(PYTHON_VERSION)

# Validate Python version whether it meets the version restriction.
_PYTHON_VERSION_CHECK:=		${_PYTHON_ARGS:C/^([1-9]\.[0-9])$/\1-\1/}
_PYTHON_VERSION_MINIMUM_TMP:=	${_PYTHON_VERSION_CHECK:C/([1-9]\.[0-9])[-+].*/\1/}
_PYTHON_VERSION_MINIMUM:=	${_PYTHON_VERSION_MINIMUM_TMP:M[1-9].[0-9]}
_PYTHON_VERSION_MAXIMUM_TMP:=	${_PYTHON_VERSION_CHECK:C/.*-([1-9]\.[0-9])/\1/}
_PYTHON_VERSION_MAXIMUM:=	${_PYTHON_VERSION_MAXIMUM_TMP:M[1-9].[0-9]}

.undef _PYTHON_VERSION_NONSUPPORTED
.if !empty(_PYTHON_VERSION_MINIMUM) && (${_PYTHON_VERSION} < ${_PYTHON_VERSION_MINIMUM})
_PYTHON_VERSION_NONSUPPORTED=	${_PYTHON_VERSION_MINIMUM} at least
.elif !empty(_PYTHON_VERSION_MAXIMUM) && (${_PYTHON_VERSION} > ${_PYTHON_VERSION_MAXIMUM})
_PYTHON_VERSION_NONSUPPORTED=	${_PYTHON_VERSION_MAXIMUM} at most
.endif

# If we have an unsupported version of Python, try another.
.if defined(_PYTHON_VERSION_NONSUPPORTED)
.if defined(PYTHON_VERSION) || defined(PYTHON_CMD)
_PV:=		${_PYTHON_VERSION}	# preserve the specified python version
WARNING+=	"needs Python ${_PYTHON_VERSION_NONSUPPORTED}. But a port depending on this one specified ${_PV}"
.endif # defined(PYTHON_VERSION) || defined(PYTHON_CMD)
.undef _PYTHON_VERSION
.for ver in ${PYTHON2_DEFAULT} ${PYTHON3_DEFAULT} ${_PYTHON_VERSIONS}
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
IGNORE=		needs an unsupported version of Python
.endif
.endif	# defined(_PYTHON_VERSION_NONSUPPORTED)

PYTHON_VERSION?=	python${_PYTHON_VERSION}
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
	@${ECHO} "  python3.3"
	@${ECHO} "  python3.4"
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
MAKE_ENV+=			PYTHONUSERBASE=${FAKE_DESTDIR}${PYTHONBASE}
PYDISTUTILS_INSTALLARGS:=	-m -q --user ${PYDISTUTILS_INSTALLARGS}

.if ${TRUE_PREFIX} != ${LOCALBASE}
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
	@${MKDIR} ${FAKE_DESTDIR}${PYEASYINSTALL_SITELIBDIR}

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

.if !target(stage-python-compileall)
stage-python-compileall:
	(cd ${FAKE_DESTDIR}${TRUE_PREFIX} && \
	${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;} && \
	${PYTHON_CMD} -O ${PYTHON_LIBDIR}/compileall.py \
		-d ${PYTHONPREFIX_SITELIBDIR} -f ${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;})
.endif

post-install: stage-python-compileall

.endif		# defined(USE_PYDISTUTILS) && ${USE_PYDISTUTILS} == "easy_install"

# distutils support
PYSETUP?=		setup.py
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
	fi;
. endfor
.else
	@${DO_NADA}
.endif

.if defined(_PYTHON_FEATURE_AUTOPLIST) && defined(_PYTHON_FEATURE_DISTUTILS)
_RELSITELIBDIR=	${PYTHONPREFIX_SITELIBDIR:S;${TRUE_PREFIX}/;;}
_RELLIBDIR=		${PYTHONPREFIX_LIBDIR:S;${TRUE_PREFIX}/;;}

add-plist-post:	add-plist-pymod
add-plist-pymod:
	@${SED} -e 's|^${FAKE_DESTDIR}${TRUE_PREFIX}/||' \
		-e 's|^${TRUE_PREFIX}/||' \
		-e 's|^\(man/.*man[0-9]\)/\(.*\.[0-9]\)$$|\1/\2.gz|' \
		-e 's|[[:alnum:]|[:space:]]*/\.\./*||g; s|/\./|/|g' \
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
.if ${PYTHON_REL} >= 3200 && defined(_PYTHON_FEATURE_PY3KPLIST)
# When Python version is 3.2+ we rewrite all the filenames
# of TMPPLIST that end with .py[co], so that they conform
# to PEP 3147 (see http://www.python.org/dev/peps/pep-3147/)
PYMAGICTAG=		${PYTHON_CMD} -c 'import imp; print(imp.get_tag())'
add-plist-post:
	@${AWK} '\
		/\.py[co]$$/ && !($$0 ~ "/" pc "/") {id = match($$0, /\/[^\/]+\.py[co]$$/); if (id != 0) {d = substr($$0, 1, RSTART - 1); dirs[d] = 1}; sub(/\.py[co]$$/,  "." mt "&"); sub(/[^\/]+\.py[co]$$/, pc "/&"); print; next} \
		/^@dirrm / {d = substr($$0, 8); if (d in dirs) {print $$0 "/" pc}; print $$0; next} \
		/^@dirrmtry / {d = substr($$0, 11); if (d in dirs) {print $$0 "/" pc}; print $$0; next} \
		{print} \
		END {if (sp in dirs) {print "@dir " sp "/" pc}} \
		' \
		pc="__pycache__" mt="$$(${PYMAGICTAG})" sp="${PYTHON_SITELIBDIR:S,${PYTHONBASE}/,,g}" \
		${TMPPLIST} > ${TMPPLIST}.pyc_tmp
	@${MV} ${TMPPLIST}.pyc_tmp ${TMPPLIST}
.endif # ${PYTHON_REL} >= 3200 && defined(_PYTHON_FEATURE_PY3KPLIST)
.endif # defined(_PYTHON_FEATURE_AUTOPLIST) && defined(_PYTHON_FEATURE_DISTUTILS)

# Fix for programs that build python from a GNU auto* environment
CONFIGURE_ENV+=	PYTHON="${PYTHON_CMD}"
# By default CMake picks up the highest available version of Python package.
# Enforce the version required by the port or the default.
CMAKE_ARGS+=	-DPython_ADDITIONAL_VERSIONS=${PYTHON_VER}

# Python 3rd-party modules
PYGAME=		${PYTHON_PKGNAMEPREFIX}game>0:${PORTSDIR}/devel/py-game
PYNUMERIC=	${PYTHON_SITELIBDIR}/Numeric/Numeric.py:${PORTSDIR}/math/py-numeric
PYNUMPY=	${PYTHON_SITELIBDIR}/numpy/core/numeric.py:${PORTSDIR}/math/py-numpy
PYXML=		${PYTHON_SITELIBDIR}/_xmlplus/__init__.py:${PORTSDIR}/textproc/py-xml

# dependencies

.if defined(_PYTHON_BUILD_DEP)
BUILD_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}
.if defined(_WANTS_META_PORT)
BUILD_DEPENDS+=	python${_WANTS_META_PORT}:${PORTSDIR}/lang/python${_WANTS_META_PORT}
.endif
.endif
.if defined(_PYTHON_RUN_DEP)
RUN_DEPENDS+=	${PYTHON_CMD}:${PYTHON_PORTSDIR}
.if defined(_WANTS_META_PORT)
RUN_DEPENDS+=	python${_WANTS_META_PORT}:${PORTSDIR}/lang/python${_WANTS_META_PORT}
.endif
.endif

# set $PREFIX as Python's one
.if defined(_PYTHON_FEATURE_PYTHONPREFIX)
PREFIX=		${PYTHONBASE}
.endif

# Substitutions for pkg-plist
# Use a short form of the PYTHONPREFIX_*DIR variables; we don't need the
# base directory in the plist file.
PLIST_SUB+=	PYTHON_INCLUDEDIR=${PYTHONPREFIX_INCLUDEDIR:S;${TRUE_PREFIX}/;;} \
		PYTHON_LIBDIR=${PYTHONPREFIX_LIBDIR:S;${TRUE_PREFIX}/;;} \
		PYTHON_PLATFORM=${PYTHON_PLATFORM} \
		PYTHON_SITELIBDIR=${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;} \
		PYTHON_VERSION=python${_PYTHON_VERSION} \
		PYTHON_VER=${PYTHON_VER}

_USES_POST+=	python
.endif	# _INCLUDE_USES_PYTHON_MK

.if defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_PYTHON_POST_MK)
_INCLUDE_USES_PYTHON_POST_MK=	yes

# py-distutils support
PYDISTUTILS_CONFIGURE_TARGET?=	config
PYDISTUTILS_BUILD_TARGET?=	build
PYDISTUTILS_INSTALL_TARGET?=	install

.if defined(_PYTHON_FEATURE_DISTUTILS)
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
.endif # defined(_PYTHON_FEATURE_DISTUTILS)
.endif # defined(_POSTMKINCLUDED) && !defined(_INCLUDE_USES_PYTHON_POST_MK)
