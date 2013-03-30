#-*- tab-width: 4; -*-
#
# $MidnightBSD: mports/Mk/components/options.mk,v 1.4 2013/03/30 03:35:50 laffer1 Exp $
#
# options.mk -- The options component
#

.if !defined(AFTERPORTMK)

OPTIONSFILE?=	${PORT_DBDIR}/${UNIQUENAME}/options
_OPTIONSFILE!=	${ECHO_CMD} "${OPTIONSFILE}"

#ALL_OPTIONS=   DOCS \
#               NLS

# Set the default values for the global options, as defined by portmgr
.if !defined(NOPORTDOCS)
PORT_OPTIONS+=  DOCS
.endif

.if !defined(WITHOUT_NLS)
PORT_OPTIONS+=  NLS
.endif

# Set the default values for the global options, as defined by portmgr
.if !defined(NOPORTEXAMPLES)
PORT_OPTIONS+=  EXAMPLES
.endif

# Activate IPV6 by default
PORT_OPTIONS+=  IPV6

# Exclude per arch options
.for opt in ${OPTIONS_EXCLUDE_${ARCH}}
OPTIONS_DEFINE:=        ${OPTIONS_DEFINE:N${opt}}
OPTIONS_DEFAULT:=       ${OPTIONS_DEFAULT:N${opt}}
.endfor

# Add per arch options
.for opt in ${OPTIONS_DEFINE_${ARCH}}
.if empty(OPTIONS_DEFINE:M${opt})
OPTIONS_DEFINE+=        ${opt}
.endif
.endfor

# Add per arch defaults
.for opt in ${OPTIONS_DEFAULT_${ARCH}}
.if empty(OPTIONS_DEFAULT:M${opt})
OPTIONS_DEFAULT+=       ${opt}
.endif
.endfor

# Append options set by the port Makefile
.for opt in ${OPTIONS_DEFINE}
ALL_OPTIONS+=   ${opt}
.endfor

ALL_OPTIONS:=   ${ALL_OPTIONS:O:u}

# Remove global options the port maintainer doesn't want
.for opt in ${OPTIONS_EXCLUDE}
ALL_OPTIONS:=   ${ALL_OPTIONS:N${opt}}
.endfor

.if defined(OPTIONS)
NO_OPTIONS_SORT=        yes
.  undef optname
.  for O in ${OPTIONS:S|\#|\\\#|g}
opt:=   ${O}
.    if !defined(optname)
optname:=       ${O}
ALL_OPTIONS+=   ${O}
.if !defined(OPTIONS_DEFINE) || empty(OPTIONS_DEFINE:M${O})
OPTIONS_DEFINE+=        ${O}
.endif
PORT_OPTIONS+=  ${O}
.    elif !defined(optdesc)
optdesc:=       ${opt}
${optname}_DESC:=       ${opt:S|"||g}
.    else
.      if ${opt:L} == off
.        if defined(PORT_OPTIONS) && defined(optname)
NO_OPTIONS+=    ${optname}
NO_OPTIONS:=    ${NO_OPTIONS:O:u}
.        else
.        endif
.      endif
.      undef optname
.      undef optdesc
.    endif
.  endfor
.  if defined(NO_OPTIONS)
.    for O in ${NO_OPTIONS}
PORT_OPTIONS:=   ${PORT_OPTIONS:N${O}}
.    endfor
.  endif
#.  undef NO_OPTIONS
.endif
#XXX end of compatibility

ALL_OPTIONS:=   ${ALL_OPTIONS:O:u}

# complete list
COMPLETE_OPTIONS_LIST=  ${ALL_OPTIONS}
.for single in ${OPTIONS_SINGLE}
COMPLETE_OPTIONS_LIST+= ${OPTIONS_SINGLE_${single}}
.endfor
.for radio in ${OPTIONS_RADIO}
COMPLETE_OPTIONS_LIST+= ${OPTIONS_RADIO_${radio}}
.endfor
.for multi in ${OPTIONS_MULTI}
COMPLETE_OPTIONS_LIST+= ${OPTIONS_MULTI_${multi}}
.endfor
.for group in ${OPTIONS_GROUP}
COMPLETE_OPTIONS_LIST+= ${OPTIONS_GROUP_${group}}
.endfor

## Now create the list of activated options
.if defined(OPTIONS_OVERRIDE)
# Special case $OPTIONS_OVERRIDE; if it is defined forget about anything done
# before
PORT_OPTIONS:=  ${OPTIONS_OVERRIDE}
.else

## Set default options defined by the port maintainer
.  for opt in ${OPTIONS_DEFAULT}
PORT_OPTIONS+=  ${opt}
.  endfor
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}

## Set system-wide defined options (set by user in make.conf)
.  for opt in ${OPTIONS_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=  ${opt}
.    endif
.  endfor
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}

## Remove the options excluded system-wide (set by user in make.conf)
.  for opt in ${OPTIONS_UNSET}
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
.  endfor

## Set the options specified per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=  ${opt}
.    endif
.  endfor
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}

## Unset the options excluded per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_UNSET}
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
.  endfor

## options files (from dialog)
.  if exists(${OPTIONSFILE}) && !make(rmconfig)
.  include "${OPTIONSFILE}"
.  endif
.  if exists(${OPTIONSFILE}.local)
.  include "${OPTIONSFILE}.local"
.  endif

### convert WITH and WITHOUT found in make.conf or reloaded from old optionsfile
.for opt in ${ALL_OPTIONS}
.if defined(WITH_${opt})
PORT_OPTIONS+=  ${opt}
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}
.endif
.if defined(WITHOUT_${opt})
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
.endif
.endfor

## Finish by using the options set by the port config dialog, if any
.  for opt in ${OPTIONS_FILE_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=  ${opt}
.    endif
.  endfor
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}

.for opt in ${OPTIONS_FILE_UNSET}
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
.endfor
.undef opt

.endif

## Cmdline always win over the rest
.for opt in ${WITH}
.  if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=  ${opt}
.  endif
.endfor
PORT_OPTIONS:=  ${PORT_OPTIONS:O:u}

.for opt in ${WITHOUT}
PORT_OPTIONS:=  ${PORT_OPTIONS:N${opt}}
.endfor
.undef opt

## Now some compatibility
.if empty(PORT_OPTIONS:MDOCS)
NOPORTDOCS=     yes
.endif

.if empty(PORT_OPTIONS:MEXAMPLES)
NOPORTEXAMPLES= yes
.endif

.if empty(PORT_OPTIONS:MNLS)
WITHOUT_NLS=    yes
.endif

.if defined(NO_OPTIONS_SORT)
_SORTED_OPTIONS:=       ${ALL_OPTIONS}
ALL_OPTIONS:=
.for opt in ${OPTIONS_DEFINE}
.if ${_SORTED_OPTIONS:M${opt}}
ALL_OPTIONS+=   ${opt}
.endif
.endfor
.undef opt
.undef _SORTED_OPTIONS
.endif

### to be removed once old OPTIONS disappear
.for opt in ${ALL_OPTIONS}
.if empty(PORT_OPTIONS:M${opt})
.   if !defined(WITH_${opt}) && !defined(WITHOUT_${opt})
WITHOUT_${opt}:=        true
.   endif
.else
.   if !defined(WITH_${opt}) && !defined(WITHOUT_${opt})
WITH_${opt}:=  true
.   endif
.endif
.      undef opt
.endfor
.endif
###


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
	@optionsdir=${OPTIONSFILE}; optionsdir=$${optionsdir%/*}; \
	${ECHO_MSG} "===>  Switching to root credentials to create $${optionsdir}"; \
	(${SU_CMD} "${SH} -c \"${MKDIR} $${optionsdir} 2> /dev/null\"") || \
	(${ECHO_MSG} "===> Cannot create $${optionsdir}, check permissions"; exit 1); \
	${ECHO_MSG} "===>  Returning to user credentials"
.else
	@(optionsdir=${OPTIONSFILE}; optionsdir=$${optionsdir%/*}; \
	${MKDIR} $${optionsdir} 2> /dev/null) || \
	(${ECHO_MSG} "===> Cannot create $${optionsdir}, check permissions"; exit 1)
.endif
	@TMPOPTIONSFILE=$$(mktemp -t portoptions); \
	trap "${RM} -f $${TMPOPTIONSFILE}; exit 1" 1 2 3 5 10 13 15; \
	${SETENV} ${D4P_ENV} ${SH} ${PORTSDIR}/Tools/scripts/dialog4ports.sh $${TMPOPTIONSFILE} || { \
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
		${ECHO_MSG} "===>  Switching to root credentials to write ${OPTIONSFILE}"; \
		${SU_CMD} "${CAT} $${TMPOPTIONSFILE} > ${OPTIONSFILE}"; \
		${ECHO_MSG} "===>  Returning to user credentials"; \
        else \
		${CAT} $${TMPOPTIONSFILE} > ${OPTIONSFILE}; \
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
.if exists(${OPTIONSFILE})
	-@${ECHO_MSG} "===> Removing user-configured options for ${PKGNAME}"; \
	optionsdir=${OPTIONSFILE}; optionsdir=$${optionsdir%/*}; \
	if [ ${UID} != 0 -a "x${INSTALL_AS_USER}" = "x" ]; then \
		${ECHO_MSG} "===> Switching to root credentials to remove ${OPTIONSFILE} and $${optionsdir}"; \
		${SU_CMD} "${RM} -f ${OPTIONSFILE} ; \
			${RMDIR} $${optionsdir}"; \
		${ECHO_MSG} "===> Returning to user credentials"; \
	else \
		${RM} -f ${OPTIONSFILE}; \
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
