# options.mk -- The options component
#

.if !defined(OPTIONSMKINCLUDED) && !defined(AFTERPORTMK)
OPTIONSMKINCLUDED=	options.mk

.if defined(USE_PYTHON)
OPTIONS_FILE=         ${PORT_DBDIR}/py-${PORTNAME}/options
.endif

OPTIONS_NAME?=	${PKGORIGIN:S/\//_/}
OPTIONS_FILE?=	${PORT_DBDIR}/${UNIQUENAME}/options
_OPTIONSFILE!=	${ECHO_CMD} "${OPTIONS_FILE}"

_OPTIONS_FLAGS=	ALL_TARGET BROKEN CABAL_EXECUTABLES CATEGORIES CFLAGS CONFIGURE_ENV \
		CONFLICTS CONFLICTS_BUILD CONFLICTS_INSTALL CPPFLAGS CXXFLAGS \
		DESKTOP_ENTRIES DISTFILES EXECUTABLES EXTRA_PATCHES EXTRACT_ONLY \
		GH_ACCOUNT GH_PROJECT GH_SUBDIR GH_TAGNAME GH_TUPLE \
		GL_ACCOUNT GL_COMMIT GL_PROJECT GL_SITE GL_SUBDIR GL_TUPLE \
		IGNORE INFO INSTALL_TARGET LDFLAGS LIBS MAKE_ARGS MAKE_ENV \
		MASTER_SITES PATCHFILES PATCH_SITES PLIST_DIRS PLIST_DIRSTRY PLIST_FILES \
		PLIST_SUB PORTDOCS PORTEXAMPLES SUB_FILES SUB_LIST \
		TEST_TARGET USE_CABAL USES BINARY_ALIAS
_OPTIONS_DEPENDS=	PKG FETCH EXTRACT PATCH BUILD LIB RUN TEST
_ALL_OPTIONS_HELPERS=	${_OPTIONS_DEPENDS:S/$/_DEPENDS/} \
			${_OPTIONS_DEPENDS:S/$/_DEPENDS_OFF/} \
			${_OPTIONS_FLAGS:S/$/_OFF/} ${_OPTIONS_FLAGS} \
			CABAL_FLAGS CMAKE_BOOL CMAKE_BOOL_OFF CMAKE_OFF CMAKE_ON \
			CONFIGURE_ENABLE CONFIGURE_OFF CONFIGURE_ON \
			CONFIGURE_WITH IMPLIES MESON_ARGS MESON_DISABLED \
			MESON_ENABLED MESON_FALSE MESON_OFF MESON_ON MESON_TRUE \
			PREVENTS PREVENTS_MSG QMAKE_OFF QMAKE_ON USE USE_OFF \
			VARS VARS_OFF

# The format here is target_family:priority:target-type
_OPTIONS_TARGETS=	fetch:300:pre fetch:500:do fetch:700:post \
			extract:300:pre extract:500:do extract:700:post \
			patch:300:pre patch:500:do patch:700:post \
			configure:300:pre configure:500:do configure:700:post \
			build:300:pre build:500:do build:700:post \
			install:300:pre install:500:do install:700:post  \
			test:300:pre test:500:do test:700:post  \
			package:300:pre package:500:do package:700:post \
			fake:800:post

# Add per arch options
.  for opt in ${OPTIONS_DEFINE_${ARCH}}
.    if empty(OPTIONS_DEFINE:M${opt})
OPTIONS_DEFINE+=	${opt}
.    endif
.  endfor

# Add per arch defaults
OPTIONS_DEFAULT+=	${OPTIONS_DEFAULT_${ARCH}}

_ALL_EXCLUDE=	${OPTIONS_EXCLUDE_${ARCH}} ${OPTIONS_EXCLUDE} \
		${OPTIONS_SLAVE} ${OPTIONS_EXCLUDE_${OPSYS}} \
		${OPTIONS_EXCLUDE_${OPSYS}_${OSREL:R}}

.  for opt in ${OPTIONS_DEFINE:O:u}
.    if !${_ALL_EXCLUDE:M${opt}}
.      for opt_implied in ${${opt}_IMPLIES}
.        if ${_ALL_EXCLUDE:M${opt_implied}}
_ALL_EXCLUDE+=	${opt}
.        endif
.      endfor
.    endif
.  endfor

# Remove options the port maintainer doesn't want, part 1
.  for opt in ${_ALL_EXCLUDE:O:u}
OPTIONS_DEFAULT:=	${OPTIONS_DEFAULT:N${opt}}
OPTIONS_DEFINE:=	${OPTIONS_DEFINE:N${opt}}
#PORT_OPTIONS:=		${PORT_OPTIONS:N${opt}}
.    for otype in SINGLE RADIO MULTI GROUP
.      for m in ${OPTIONS_${otype}}
OPTIONS_${otype}_${m}:=	${OPTIONS_${otype}_${m}:N${opt}}
.      endfor
.    endfor
.  endfor

# Remove empty SINGLE/GROUP/RADIO/MULTI
# Can be empty because of exclude/slaves
.  for otype in SINGLE RADIO MULTI GROUP
.    for m in ${OPTIONS_${otype}}
.      if empty(OPTIONS_${otype}_${m})
OPTIONS_${otype}:=	${OPTIONS_${otype}:N${m}}
.      endif
.    endfor
.  endfor

# Sort options
ALL_OPTIONS:=	${OPTIONS_DEFINE:O:u}
OPTIONS_DEFAULT:=	${OPTIONS_DEFAULT:O:u}

# complete list
COMPLETE_OPTIONS_LIST=	${ALL_OPTIONS}
.  for otype in SINGLE RADIO MULTI GROUP
.    for m in ${OPTIONS_${otype}}
COMPLETE_OPTIONS_LIST+=	${OPTIONS_${otype}_${m}}
.    endfor
.  endfor

# Some options are always enabled by default.
.  for _opt in DOCS NLS EXAMPLES IPV6
.    if ${COMPLETE_OPTIONS_LIST:M${_opt}}
PORT_OPTIONS+=	${_opt}
.    endif
.  endfor

# Remove options the port maintainer doesn't want, part 2
.  for opt in ${_ALL_EXCLUDE:O:u}
PORT_OPTIONS:=		${PORT_OPTIONS:N${opt}}
.  endfor

## Now create the list of activated options
.  if defined(OPTIONS_OVERRIDE)
# Special case $OPTIONS_OVERRIDE; if it is defined forget about anything done
# before
NEW_OPTIONS=
PORT_OPTIONS:=	${OPTIONS_OVERRIDE}
.  else
NEW_OPTIONS=	${COMPLETE_OPTIONS_LIST}

## Set default options defined by the port maintainer
PORT_OPTIONS+=	${OPTIONS_DEFAULT}

## Set system-wide defined options (set by user in make.conf)
.    for opt in ${OPTIONS_SET}
.      if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.      endif
.    endfor

## Remove the options excluded system-wide (set by user in make.conf)
.    for opt in ${OPTIONS_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endfor

## Set the options specified per-port (set by user in make.conf)
.    for opt in ${${OPTIONS_NAME}_SET}
.      if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.      endif
.    endfor

## Unset the options excluded per-port (set by user in make.conf)
.    for opt in ${${OPTIONS_NAME}_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endfor

## options files (from dialog)
.    if exists(${OPTIONS_FILE}) && !make(rmconfig)
.  include "${OPTIONS_FILE}"
.    endif
.  sinclude "${OPTIONS_FILE}.local"

_OPTIONS_UNIQUENAME=	${PKGNAMEPREFIX}${PORTNAME}
.    for _k in SET UNSET SET_FORCE UNSET_FORCE
.      if defined(${_OPTIONS_UNIQUENAME}_${_k})
WARNING+=	"You are using ${_OPTIONS_UNIQUENAME}_${_k} which is not supported any more, use:"
WARNING+=	"${OPTIONS_NAME}_${_k}=	${${_OPTIONS_UNIQUENAME}_${_k}}"
.      endif
.    endfor

## Finish by using the options set by the port config dialog, if any
.    for opt in ${OPTIONS_FILE_SET}
.      if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.      endif
.    endfor

.    for opt in ${OPTIONS_FILE_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endfor

.  endif

## FORCE
## Set system-wide defined options (set by user in make.conf)
.  for opt in ${OPTIONS_SET_FORCE}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Remove the options excluded system-wide (set by user in make.conf)
.  for opt in ${OPTIONS_UNSET_FORCE}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor

## Set the options specified per-port (set by user in make.conf)
.  for opt in ${${OPTIONS_NAME}_SET_FORCE}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Unset the options excluded per-port (set by user in make.conf)
.  for opt in ${${OPTIONS_NAME}_UNSET_FORCE}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor


## Cmdline always win over the rest
.  for opt in ${WITH}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

.  for opt in ${WITHOUT}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor

## Enable options implied by other options
# _PREVENTS is handled in bsd.port.mk:pre-check-config
## 1) Build dependency chain in A.B format:
_DEPCHAIN=
.  for opt in ${COMPLETE_OPTIONS_LIST}
.    for o in ${${opt}_IMPLIES}
_DEPCHAIN+=	${opt}.$o
.    endfor
.  endfor
## 2) Check each dependency pair and if LHS is in PORT_OPTIONS then add RHS.
##    All of RHS of "RHS.*" (i.e. indirect dependency) are also added for
##    fast convergence.
_PORT_OPTIONS:=	${PORT_OPTIONS}
.  for _count in _0 ${COMPLETE_OPTIONS_LIST}
count=	${_count}
### Check if all of the nested dependency are resolved already.
.    if ${count} == _0 || ${_PORT_OPTIONS} != ${PORT_OPTIONS}
PORT_OPTIONS:=	${_PORT_OPTIONS}
.      for dc in ${_DEPCHAIN}
.        for opt in ${_PORT_OPTIONS}
_opt=${opt}
### Add all of direct and indirect dependency only if
### they are not in ${PORT_OPTIONS}.
.          if !empty(_opt:M${dc:R})
.            for d in ${dc:E} ${_DEPCHAIN:M${dc:E}.*:E}
.              if empty(_PORT_OPTIONS:M$d)
_PORT_OPTIONS+=	$d
.              endif
.            endfor
.          endif
.        endfor
.      endfor
.    endif
.  endfor

# Finally, add options required by slave ports
PORT_OPTIONS+=	${OPTIONS_SLAVE}

# Sort options and eliminate duplicates
PORT_OPTIONS:=	${PORT_OPTIONS:O:u}

_REALLY_ALL_POSSIBLE_OPTIONS:=	${COMPLETE_OPTIONS_LIST} ${_ALL_EXCLUDE}
_REALLY_ALL_POSSIBLE_OPTIONS:=	${_REALLY_ALL_POSSIBLE_OPTIONS:O:u}

# Handle PORTDOCS and PORTEXAMPLES
.  for _type in DOCS EXAMPLES
.    if !empty(_REALLY_ALL_POSSIBLE_OPTIONS:M${_type})
.      if empty(PORT_OPTIONS:M${_type})
PLIST_SUB+=		PORT${_type}="@comment "
.      else
PLIST_SUB+=		PORT${_type}=""
.      endif
.    endif
.  endfor

.  if defined(NO_OPTIONS_SORT)
ALL_OPTIONS=	${OPTIONS_DEFINE}
.  endif

.  for target in ${_OPTIONS_TARGETS:C/:.*//:u}
_OPTIONS_${target}?=
.  endfor

.  for opt in ${_REALLY_ALL_POSSIBLE_OPTIONS}
# PLIST_SUB
PLIST_SUB?=
SUB_LIST?=
.    if defined(OPTIONS_SUB)
.      if ! ${PLIST_SUB:M${opt}=*}
.        if ${PORT_OPTIONS:M${opt}}
PLIST_SUB:=	${PLIST_SUB} ${opt}="" NO_${opt}="@comment "
.        else
PLIST_SUB:=	${PLIST_SUB} ${opt}="@comment " NO_${opt}=""
.        endif
.      endif
.      if ! ${SUB_LIST:M${opt}=*}
.        if ${PORT_OPTIONS:M${opt}}
SUB_LIST:=	${SUB_LIST} ${opt}="" NO_${opt}="@comment "
.        else
SUB_LIST:=	${SUB_LIST} ${opt}="@comment " NO_${opt}=""
.        endif
.      endif
.    endif

.    if ${PORT_OPTIONS:M${opt}}
.      if defined(${opt}_USE)
.        for option in ${${opt}_USE:C/=.*//:O:u}
_u=		${option}
USE_${_u:tu}+=	${${opt}_USE:M${option}=*:C/.*=//g:C/,/ /g}
.        endfor
.      endif
.      if defined(${opt}_VARS)
.        for var in ${${opt}_VARS:C/=.*//:O:u}
_u=			${var}
.          if ${_u:M*+}
${_u:C/.$//:tu}+=	${${opt}_VARS:M${var}=*:C/[^+]*\+=//:C/^"(.*)"$$/\1/}
.          else
${_u:tu}=		${${opt}_VARS:M${var}=*:C/[^=]*=//:C/^"(.*)"$$/\1/}
.          endif
.        endfor
.      endif
.      if defined(${opt}_CONFIGURE_ENABLE)
CONFIGURE_ARGS+=	${${opt}_CONFIGURE_ENABLE:S/^/--enable-/}
.      endif
.      if defined(${opt}_CONFIGURE_WITH)
CONFIGURE_ARGS+=	${${opt}_CONFIGURE_WITH:S/^/--with-/}
.      endif
.      if defined(${opt}_CMAKE_BOOL)
CMAKE_ARGS+=		${${opt}_CMAKE_BOOL:C/.*/-D&:BOOL=true/}
.      endif
.      if defined(${opt}_CMAKE_BOOL_OFF)
CMAKE_ARGS+=		${${opt}_CMAKE_BOOL_OFF:C/.*/-D&:BOOL=false/}
.      endif
.      if defined(${opt}_MESON_TRUE)
MESON_ARGS+=		${${opt}_MESON_TRUE:C/.*/-D&=true/}
.      endif
.      if defined(${opt}_MESON_FALSE)
MESON_ARGS+=		${${opt}_MESON_FALSE:C/.*/-D&=false/}
.      endif
.      if defined(${opt}_MESON_YES)
MESON_ARGS+=		${${opt}_MESON_YES:C/.*/-D&=yes/}
.      endif
.      if defined(${opt}_MESON_NO)
MESON_ARGS+=		${${opt}_MESON_NO:C/.*/-D&=no/}
.      endif
.      if defined(${opt}_MESON_ENABLED)
MESON_ARGS+=		${${opt}_MESON_ENABLED:C/.*/-D&=enabled/}
.      endif
.      if defined(${opt}_MESON_DISABLED)
MESON_ARGS+=		${${opt}_MESON_DISABLED:C/.*/-D&=disabled/}
.      endif
.      if defined(${opt}_CABAL_FLAGS)
CABAL_FLAGS+=	${${opt}_CABAL_FLAGS}
.      endif
.      for configure in CONFIGURE CMAKE MESON QMAKE
.        if defined(${opt}_${configure}_ON)
${configure}_ARGS+=	${${opt}_${configure}_ON}
.        endif
.      endfor
.      for flags in ${_OPTIONS_FLAGS}
.        if defined(${opt}_${flags})
${flags}+=	${${opt}_${flags}}
.        endif
.      endfor
.      for deptype in ${_OPTIONS_DEPENDS}
.        if defined(${opt}_${deptype}_DEPENDS)
${deptype}_DEPENDS+=	${${opt}_${deptype}_DEPENDS}
.        endif
.      endfor
.      for target in ${_OPTIONS_TARGETS}
_target=	${target:C/:.*//}
_prio=		${target:C/.*:(.*):.*/\1/}
_type=		${target:C/.*://}
_OPTIONS_${_target}:=	${_OPTIONS_${_target}} ${_prio}:${_type}-${_target}-${opt}-on
.      endfor
.    else
.      if defined(${opt}_USE_OFF)
.        for option in ${${opt}_USE_OFF:C/=.*//:O:u}
_u=		${option}
USE_${_u:tu}+=	${${opt}_USE_OFF:M${option}=*:C/.*=//g:C/,/ /g}
.        endfor
.      endif
.      if defined(${opt}_VARS_OFF)
.        for var in ${${opt}_VARS_OFF:C/=.*//:O:u}
_u=			${var}
.          if ${_u:M*+}
${_u:C/.$//:tu}+=	${${opt}_VARS_OFF:M${var}=*:C/[^+]*\+=//:C/^"(.*)"$$/\1/}
.          else
${_u:tu}=		${${opt}_VARS_OFF:M${var}=*:C/[^=]*=//:C/^"(.*)"$$/\1/}
.          endif
.        endfor
.      endif
.      if defined(${opt}_CONFIGURE_ENABLE)
CONFIGURE_ARGS+=	${${opt}_CONFIGURE_ENABLE:S/^/--disable-/:C/=.*//}
.      endif
.      if defined(${opt}_CONFIGURE_WITH)
CONFIGURE_ARGS+=	${${opt}_CONFIGURE_WITH:S/^/--without-/:C/=.*//}
.      endif
.      if defined(${opt}_CMAKE_BOOL)
CMAKE_ARGS+=		${${opt}_CMAKE_BOOL:C/.*/-D&:BOOL=false/}
.      endif
.      if defined(${opt}_CMAKE_BOOL_OFF)
CMAKE_ARGS+=		${${opt}_CMAKE_BOOL_OFF:C/.*/-D&:BOOL=true/}
.      endif
.      if defined(${opt}_MESON_TRUE)
MESON_ARGS+=		${${opt}_MESON_TRUE:C/.*/-D&=false/}
.      endif
.      if defined(${opt}_MESON_FALSE)
MESON_ARGS+=            ${${opt}_MESON_FALSE:C/.*/-D&=true/}
.      endif
.      if defined(${opt}_MESON_YES)
MESON_ARGS+=		${${opt}_MESON_YES:C/.*/-D&=no/}
.      endif
.      if defined(${opt}_MESON_NO)
MESON_ARGS+=		${${opt}_MESON_NO:C/.*/-D&=yes/}
.      endif
.      if defined(${opt}_MESON_ENABLED)
MESON_ARGS+=		${${opt}_MESON_ENABLED:C/.*/-D&=disabled/}
.      endif
.      if defined(${opt}_MESON_DISABLED)
MESON_ARGS+=		${${opt}_MESON_DISABLED:C/.*/-D&=enabled/}
.      endif
.      if defined(${opt}_CABAL_FLAGS)
CABAL_FLAGS+=	-${${opt}_CABAL_FLAGS}
.      endif
.      for configure in CONFIGURE CMAKE MESON QMAKE
.        if defined(${opt}_${configure}_OFF)
${configure}_ARGS+=	${${opt}_${configure}_OFF}
.        endif
.      endfor
.      for flags in ${_OPTIONS_FLAGS}
.        if defined(${opt}_${flags}_OFF)
${flags}+=	${${opt}_${flags}_OFF}
.        endif
.      endfor
.      for deptype in ${_OPTIONS_DEPENDS}
.        if defined(${opt}_${deptype}_DEPENDS_OFF)
${deptype}_DEPENDS+=	${${opt}_${deptype}_DEPENDS_OFF}
.        endif
.      endfor
.      for target in ${_OPTIONS_TARGETS}
_target=	${target:C/:.*//}
_prio=		${target:C/.*:(.*):.*/\1/}
_type=		${target:C/.*://}
_OPTIONS_${_target}:=	${_OPTIONS_${_target}} ${_prio}:${_type}-${_target}-${opt}-off
.      endfor
.    endif
.  endfor

# Collect which options helpers are defined at this point for
# bsd.sanity.mk later to make sure no other options helper is
# defined after bsd.port.options.mk.
_OPTIONS_HELPERS_SEEN=
.  for opt in ${_REALLY_ALL_POSSIBLE_OPTIONS}
.    for helper in ${_ALL_OPTIONS_HELPERS}
.      if defined(${opt}_${helper})
_OPTIONS_HELPERS_SEEN+=	${opt}_${helper}
.      endif
.    endfor
.  endfor

.undef (SELECTED_OPTIONS)
.undef (DESELECTED_OPTIONS)
# Wait to expand PORT_OPTIONS until the last moment in case something modifies
# the selected OPTIONS after bsd.mport.options.mk is included.  This uses
# bmake's :@ for loop.
_SELECTED_OPTIONS=	${ALL_OPTIONS:@opt@${PORT_OPTIONS:M${opt}}@}
_DESELECTED_OPTIONS=	${ALL_OPTIONS:@opt@${"${PORT_OPTIONS:M${opt}}":?:${opt}}@}
.  for otype in MULTI GROUP SINGLE RADIO
.    for m in ${OPTIONS_${otype}}
_SELECTED_OPTIONS+=	${OPTIONS_${otype}_${m}:@opt@${PORT_OPTIONS:M${opt}}@}
_DESELECTED_OPTIONS+=	${OPTIONS_${otype}_${m}:@opt@${"${PORT_OPTIONS:M${opt}}":?:${opt}}@}
.    endfor
.  endfor
SELECTED_OPTIONS=	${_SELECTED_OPTIONS:O:u}
DESELECTED_OPTIONS=	${_DESELECTED_OPTIONS:O:u}

.endif #onetime run through

.if defined(_POSTMKINCLUDED)

.if !target(pre-check-config)
pre-check-config:
.for single in ${OPTIONS_SINGLE}
.  for opt in ${OPTIONS_SINGLE_${single}}
.    if empty(ALL_OPTIONS:M${single}) || !empty(PORT_OPTIONS:M${single})
.      if !empty(PORT_OPTIONS:M${opt})
.        if defined(OPTFOUND)
OPTIONS_WRONG_SINGLE+=  ${single}
.        else
OPTFOUND=       true
.        endif
.      endif
.    else
# if conditional and if the condition is unchecked, remove opt from the list of
# set options
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
OPTNOCHECK=     true
.    endif
.  endfor
.  if !defined(OPTFOUND) && !defined(OPTNOCHECK)
OPTIONS_WRONG_SINGLE+=  ${single}
.  endif
.  undef OPTFOUND
.  undef OPTNOCHECK
.endfor
.undef single

.for radio in ${OPTIONS_RADIO}
.  for opt in ${OPTIONS_RADIO_${radio}}
.    if !empty(PORT_OPTIONS:M${opt})
.      if defined(OPTFOUND)
OPTIONS_WRONG_RADIO+=   ${radio}
.      else
OPTFOUND=       true
.      endif
.    endif
.  endfor
.  undef OPTFOUND
.endfor
.for multi in ${OPTIONS_MULTI}
.  for opt in ${OPTIONS_MULTI_${multi}}
.    if empty(ALL_OPTIONS:M${multi}) || !empty(PORT_OPTIONS:M${multi})
.      if !empty(PORT_OPTIONS:M${opt})
OPTFOUND=       true
.      endif
.    else
# if conditional and if the condition is unchecked, remove opt from the list of
# set options
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
OPTNOCHECK=     true
.    endif
.  endfor
.  if !defined(OPTFOUND) && !defined(OPTNOCHECK)
OPTIONS_WRONG_MULTI+=   ${multi}
.  endif
.  undef OPTFOUND
.  undef OPTNOCHECK
.endfor
.undef multi
.undef opt
.endif #pre-check-config

.if !target(check-config)
check-config: _check-config
.if !empty(_CHECK_CONFIG_ERROR)
	@exit 1
.endif
.endif # check-config

.if !target(_check-config)
_check-config: pre-check-config
.for multi in ${OPTIONS_WRONG_MULTI}
	@${ECHO_MSG} "====> You must check at least one option in the ${multi} multi"
.endfor
.for single in ${OPTIONS_WRONG_SINGLE}
	@${ECHO_MSG} "====> You must select one and only one option from the ${single} single"
.endfor
.for radio in ${OPTIONS_WRONG_RADIO}
	@${ECHO_MSG} "====> You cannot select multiple options from the ${radio} radio"
.endfor
.if !empty(OPTIONS_WRONG_MULTI) || !empty(OPTIONS_WRONG_SINGLE) || !empty(OPTIONS_WRONG_RADIO)
_CHECK_CONFIG_ERROR=    true
.endif
.endif # _check-config

.if !target(sanity-config)
sanity-config: _check-config
.if !empty(_CHECK_CONFIG_ERROR)
	@echo -n "Config is invalid. Re-edit? [Y/n] "; \
	read answer; \
	case $$answer in \
	[Nn]|[Nn][Oo]) \
		exit 0; \
	esac; \
	cd ${.CURDIR} && ${MAKE} config
.endif
.endif # sanity-config

# XXX: is this really the right place for ENV
.if !target(pre-config)
pre-config:
D4P_ENV=	PKGNAME="${PKGNAME}" \
		PORT_OPTIONS="${PORT_OPTIONS}" \
		ALL_OPTIONS="${ALL_OPTIONS}" \
		OPTIONS_MULTI="${OPTIONS_MULTI}" \
		OPTIONS_SINGLE="${OPTIONS_SINGLE}" \
		OPTIONS_RADIO="${OPTIONS_RADIO}" \
		OPTIONS_GROUP="${OPTIONS_GROUP}" \
 		DIALOG4PORTS="${DIALOG4PORTS}" \
		PREFIX="${PREFIX}" \
		LOCALBASE="${LOCALBASE}" \
                PORTSDIR="${PORTSDIR}" \
                MAKE="${MAKE}" \
                D4PHEIGHT="${D4PHEIGHT}" \
                D4PWIDTH="${D4PWIDTH}" \
                D4PFULLSCREEN="${D4PFULLSCREEN}"
.if exists(${PKGHELP})
D4P_ENV+=	PKGHELP="${PKGHELP}"
.endif
.for opt in ${ALL_OPTIONS}
D4P_ENV+=        ${opt}_DESC=""${${opt}_DESC:Q}""
.endfor
.for multi in ${OPTIONS_MULTI}
D4P_ENV+=       OPTIONS_MULTI_${multi}="${OPTIONS_MULTI_${multi}}" \
                ${multi}_DESC=""${${multi}_DESC:Q}""
.  for opt in ${OPTIONS_MULTI_${multi}}
D4P_ENV+=        ${opt}_DESC=""${${opt}_DESC:Q}""
.  endfor
.endfor
.for single in ${OPTIONS_SINGLE}
D4P_ENV+=       OPTIONS_SINGLE_${single}="${OPTIONS_SINGLE_${single}}" \
                ${single}_DESC=""${${single}_DESC:Q}""
.  for opt in ${OPTIONS_SINGLE_${single}}
D4P_ENV+=        ${opt}_DESC=""${${opt}_DESC:Q}""
.  endfor
.endfor
.for radio in ${OPTIONS_RADIO}
D4P_ENV+=       OPTIONS_RADIO_${radio}="${OPTIONS_RADIO_${radio}}" \
                ${radio}_DESC=""${${radio}_DESC:Q}""
.  for opt in ${OPTIONS_RADIO_${radio}}
D4P_ENV+=        ${opt}_DESC=""${${opt}_DESC:Q}""
.  endfor
.endfor
.for group in ${OPTIONS_GROUP}
D4P_ENV+=       OPTIONS_GROUP_${group}="${OPTIONS_GROUP_${group}}" \
                ${group}_DESC=""${${group}_DESC:Q}""
.  for opt in ${OPTIONS_GROUP_${group}}
D4P_ENV+=        ${opt}_DESC=""${${opt}_DESC:Q}""
.  endfor
.endfor
.undef multi
.undef single
.undef group
.undef opt
.endif # pre-config

.if !target(do-config)
do-config:
.if empty(ALL_OPTIONS) && empty(OPTIONS_SINGLE) && empty(OPTIONS_MULTI) && empty(OPTIONS_RADIO) && empty(OPTIONS_GROUP)
	@${ECHO_MSG} "===> No options to configure"
.else
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@optionsdir=${OPTIONS_FILE}; optionsdir=$${optionsdir%/*}; \
	${ECHO_MSG} "===>  Switching to root credentials to create $${optionsdir}"; \
	(${SU_CMD} "${SH} -c \"${MKDIR} $${optionsdir} 2> /dev/null\"") || \
	(${ECHO_MSG} "===> Cannot create $${optionsdir}, check permissions"; exit 1); \
	${ECHO_MSG} "===>  Returning to user credentials"
.else
	@(optionsdir=${OPTIONS_FILE}; optionsdir=$${optionsdir%/*}; \
	${MKDIR} $${optionsdir} 2> /dev/null) || \
	(${ECHO_MSG} "===> Cannot create $${optionsdir}, check permissions"; exit 1)
.endif
	@TMPOPTIONSFILE=$$(mktemp -t portoptions); \
	trap "${RM} -f $${TMPOPTIONSFILE}; exit 1" 1 2 3 5 10 13 15; \
	${SETENV} ${D4P_ENV} ${SH} ${SCRIPTSDIR}/dialog4ports.sh $${TMPOPTIONSFILE} || { \
		${RM} -f $${TMPOPTIONSFILE}; \
		${ECHO_MSG} "===> Options unchanged"; \
		exit 0; \
	}; \
	${ECHO_CMD}; \
	if [ ! -e $${TMPOPTIONSFILE} ]; then \
		${ECHO_MSG} "===> No user-specified options to save for ${PKGNAME}"; \
		exit 0; \
	fi; \
	SELOPTIONS=$$(${CAT} $${TMPOPTIONSFILE}); \
	${RM} -f $${TMPOPTIONSFILE}; \
	TMPOPTIONSFILE=$$(mktemp -t portoptions); \
	trap "${RM} -f $${TMPOPTIONSFILE}; exit 1" 1 2 3 5 10 13 15; \
	${ECHO_CMD} "# This file is auto-generated by 'make config'." > $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "# Options for ${PKGNAME}" >> $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "_OPTIONS_READ=${PKGNAME}" >> $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "_FILE_COMPLETE_OPTIONS_LIST=${COMPLETE_OPTIONS_LIST}" >> $${TMPOPTIONSFILE}; \
	for i in ${COMPLETE_OPTIONS_LIST}; do \
		if ${ECHO_CMD} $${SELOPTIONS} | ${GREP} -qw $${i}; then \
			${ECHO_CMD} "OPTIONS_FILE_SET+=$${i}" >> $${TMPOPTIONSFILE}; \
		else \
			${ECHO_CMD} "OPTIONS_FILE_UNSET+=$${i}" >> $${TMPOPTIONSFILE}; \
		fi; \
	done; \
	if [ ${UID} != 0 -a "x${INSTALL_AS_USER}" = "x" ]; then \
		${ECHO_MSG} "===>  Switching to root credentials to write ${OPTIONS_FILE}"; \
		${SU_CMD} "${CAT} $${TMPOPTIONSFILE} > ${OPTIONS_FILE}"; \
		${ECHO_MSG} "===>  Returning to user credentials"; \
        else \
		${CAT} $${TMPOPTIONSFILE} > ${OPTIONS_FILE}; \
	fi; \
	${RM} -f $${TMPOPTIONSFILE}
	@cd ${.CURDIR} && ${MAKE} sanity-config
.endif
.endif # do-config


.if !target(config)
.if !defined(NO_DIALOG)
config: pre-config do-config
.else
config:
	@${ECHO_MSG} "===> Skipping 'config' as NO_DIALOG is defined"
.endif
.endif # config

.if !target(config-recursive)
config-recursive:
	@${ECHO_MSG} "===> Setting user-specified options for ${PKGNAME} and dependencies";
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} config-conditional); \
	done
.endif # config-recursive

.if !target(config-conditional)
config-conditional: pre-config
.if defined(COMPLETE_OPTIONS_LIST) && !defined(NO_DIALOG)
.  if !defined(_FILE_COMPLETE_OPTIONS_LIST) || ${COMPLETE_OPTIONS_LIST:O} != ${_FILE_COMPLETE_OPTIONS_LIST:O}
	@cd ${.CURDIR} && ${MAKE} do-config;
.  endif
.endif
.endif # config-conditional


.if !target(showconfig)
.include "${PORTSDIR}/Mk/components/options.desc.mk"
showconfig:
.if !empty(ALL_OPTIONS) || !empty(OPTIONS_SINGLE) || !empty(OPTIONS_MULTI) || !empty(OPTIONS_RADIO) || !empty(OPTIONS_GROUP)
	@${ECHO_MSG} "===> The following configuration options are available for ${PKGNAME}":
.for opt in ${ALL_OPTIONS}
.  if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "     ${opt}=off"
.  else
	@${ECHO_MSG} -n "     ${opt}=on"
.  endif
.  if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.  endif
	@${ECHO_MSG} ""
.endfor
#multi and conditional multis
.for multi in ${OPTIONS_MULTI}
	@${ECHO_MSG} "====> Options available for the multi ${multi}: you have to choose at least one of them"
.  for opt in ${OPTIONS_MULTI_${multi}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "     ${opt}=off"
.    else
	@${ECHO_MSG} -n "     ${opt}=on"
.    endif
.    if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.    endif
	@${ECHO_MSG} ""
.  endfor
.endfor
#single and conditional singles

.for single in ${OPTIONS_SINGLE}
	@${ECHO_MSG} "====> Options available for the single ${single}: you have to select exactly one of them"
.  for opt in ${OPTIONS_SINGLE_${single}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "     ${opt}=off"
.    else
	@${ECHO_MSG} -n "     ${opt}=on"
.    endif
.    if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.    endif
	@${ECHO_MSG} ""
.  endfor
.endfor

.for radio in ${OPTIONS_RADIO}
	@${ECHO_MSG} "====> Options available for the radio ${radio}: you can only select none or one of them"
.  for opt in ${OPTIONS_RADIO_${radio}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "     ${opt}=off"
.    else
	@${ECHO_MSG} -n "     ${opt}=on"
.    endif
.    if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.    endif
	@${ECHO_MSG} ""
.  endfor
.endfor

.for group in ${OPTIONS_GROUP}
	@${ECHO_MSG} "====> Options available for the group ${group}"
.  for opt in ${OPTIONS_GROUP_${group}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "     ${opt}=off"
.    else
	@${ECHO_MSG} -n "     ${opt}=on"
.    endif
.    if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.    endif
	@${ECHO_MSG} ""
.  endfor
.endfor

.undef multi
.undef single
.undef radio
.undef group
.undef opt
	@${ECHO_MSG} "===> Use 'make config' to modify these settings"
.endif
.endif #showconfig

.if !target(showconfig-recursive)
showconfig-recursive:
	@${ECHO_MSG} "===> The following configuration options are available for ${PKGNAME} and dependencies";
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} showconfig); \
	done
.endif # showconfig-recursive

.if !target(rmconfig)
rmconfig:
.if exists(${OPTIONS_FILE})
	-@${ECHO_MSG} "===> Removing user-configured options for ${PKGNAME}"; \
	optionsdir=${OPTIONS_FILE}; optionsdir=$${optionsdir%/*}; \
	if [ ${UID} != 0 -a "x${INSTALL_AS_USER}" = "x" ]; then \
		${ECHO_MSG} "===> Switching to root credentials to remove ${OPTIONS_FILE} and $${optionsdir}"; \
		${SU_CMD} "${RM} -f ${OPTIONS_FILE} ; \
			${RMDIR} $${optionsdir}"; \
		${ECHO_MSG} "===> Returning to user credentials"; \
	else \
		${RM} -f ${OPTIONS_FILE}; \
		${RMDIR} $${optionsdir} 2>/dev/null || return 0; \
	fi
.else
	@${ECHO_MSG} "===> No user-specified options configured for ${PKGNAME}"
.endif
.endif # rmconfig

.if !target(rmconfig-recursive)
rmconfig-recursive:
	@${ECHO_MSG} "===> Removing user-specified options for ${PKGNAME} and dependencies";
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} rmconfig); \
	done
.endif # rmconfig-recursive

.if !target(pretty-print-config)
pretty-print-config:
.for opt in ${ALL_OPTIONS}
.  if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "-${opt} "
.  else
	@${ECHO_MSG} -n "+${opt} "
.  endif
.endfor
.for multi in ${OPTIONS_MULTI}
	@${ECHO_MSG} -n "${multi}[ "
.  for opt in ${OPTIONS_MULTI_${multi}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "-${opt} "
.    else
	@${ECHO_MSG} -n "+${opt} "
.    endif
.  endfor
	@${ECHO_MSG} -n "] "
.endfor
.for single in ${OPTIONS_SINGLE}
	@${ECHO_MSG} -n "${single}( "
.  for opt in ${OPTIONS_SINGLE_${single}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "-${opt} "
.    else
	@${ECHO_MSG} -n "+${opt} "
.    endif
.  endfor
	@${ECHO_MSG} -n ") "
.endfor
.for radio in ${OPTIONS_RADIO}
	@${ECHO_MSG} -n "${radio}( "
.  for opt in ${OPTIONS_RADIO_${radio}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "-${opt} "
.    else
	@${ECHO_MSG} -n "+${opt} "
.    endif
.  endfor
	@${ECHO_MSG} -n ") "
.endfor

.for group in ${OPTIONS_GROUP}
	@${ECHO_MSG} -n "${group}[ "
.  for opt in ${OPTIONS_GROUP_${group}}
.    if empty(PORT_OPTIONS:M${opt})
	@${ECHO_MSG} -n "-${opt} "
.    else
	@${ECHO_MSG} -n "+${opt} "
.    endif
.  endfor
	@${ECHO_MSG} -n "] "
.endfor
.undef multi
.undef single
.undef radio
.undef group
.undef opt
	@${ECHO_MSG} ""
.endif # pretty-print-config

options-message:
.if defined(GNOME_OPTION_MSG) && (!defined(PACKAGE_BUILDING) || !defined(BATCH))
	@for m in ${GNOME_OPTION_MSG}; do \
		${ECHO_MSG} $$m; \
	done
.else
	@${DO_NADA}
.endif
.if defined(_OPTIONS_READ)
	@${ECHO_MSG} "===>  Found saved configuration for ${_OPTIONS_READ}"
.endif

.endif
