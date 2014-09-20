#-*- tab-width: 4; -*-
#
# $MidnightBSD$
#
# options.mk -- The options component
#

.if !defined(OPTIONSMKINCLUDED)
OPTIONSMKINCLUDED=	options.mk

OPTIONS_NAME?=	${PKGORIGIN:S/\//_/}
OPTIONSFILE?=	${PORT_DBDIR}/${UNIQUENAME}/options
OPTIONS_FILE?=	${PORT_DBDIR}/${OPTIONS_NAME}/options

_OPTIONS_FLAGS=	ALL_TARGET CATEGORIES CFLAGS CONFIGURE_ENV CONFLICTS \
		CONFLICTS_BUILD CONFLICTS_INSTALL CPPFLAGS CXXFLAGS DISTFILES \
		EXTRA_PATCHES INSTALL_TARGET LDFLAGS LIBS MAKE_ARGS MAKE_ENV \
		PATCHFILES PATCH_SITES PLIST_DIRS PLIST_DIRSTRY PLIST_FILES \
		USES INFO
_OPTIONS_DEPENDS=	PKG FETCH EXTRACT PATCH BUILD LIB RUN

# Set the default values for the global options
.if !defined(NOPORTDOCS)
PORT_OPTIONS+=	DOCS
.else
OPTIONS_WARNINGS+=		"NOPORTDOCS"
WITHOUT+=			DOCS
OPTIONS_WARNINGS_UNSET+=	DOCS
.endif

.if !defined(WITHOUT_NLS)
PORT_OPTIONS+=	NLS
.else
WITHOUT+=		NLS
.endif

.if !defined(NOPORTEXAMPLES)
PORT_OPTIONS+=	EXAMPLES
.else
OPTIONS_WARNINGS+=		"NOPORTEXAMPLES"
WITHOUT+=			EXAMPLES
OPTIONS_WARNINGS_UNSET+=	EXAMPLES
.endif

PORT_OPTIONS+=	IPV6

# Add per arch options
.for opt in ${OPTIONS_DEFINE_${ARCH}}
.if empty(OPTIONS_DEFINE:M${opt})
OPTIONS_DEFINE+=	${opt}
.endif
.endfor

# Add per arch defaults
OPTIONS_DEFAULT+=	${OPTIONS_DEFAULT_${ARCH}}

# Remove options the port maintainer doesn't want
.for opt in ${OPTIONS_EXCLUDE_${ARCH}} ${OPTIONS_EXCLUDE} ${OPTIONS_SLAVE}
OPTIONS_DEFAULT:=	${OPTIONS_DEFAULT:N${opt}}
OPTIONS_DEFINE:=	${OPTIONS_DEFINE:N${opt}}
PORT_OPTIONS:=		${PORT_OPTIONS:N${opt}}
.  for otype in SINGLE RADIO MULTI GROUP
.    for m in ${OPTIONS_${otype}}
OPTIONS_${otype}_${m}:=	${OPTIONS_${otype}_${m}:N${opt}}
.    endfor
.  endfor
.endfor

# Remove empty SINGLE/GROUP/RADIO/MULTI
# Can be empty because of exclude/slaves
.for otype in SINGLE RADIO MULTI GROUP
.  for m in ${OPTIONS_${otype}}
.    if empty(OPTIONS_${otype}_${m})
OPTIONS_${otype}:=	${OPTIONS_${otype}:N${m}}
.    endif
.  endfor
.endfor

# Sort options
ALL_OPTIONS:=	${OPTIONS_DEFINE:O:u}
OPTIONS_DEFAULT:=	${OPTIONS_DEFAULT:O:u}

# complete list
COMPLETE_OPTIONS_LIST=	${ALL_OPTIONS}
.for otype in SINGLE RADIO MULTI GROUP
.  for m in ${OPTIONS_${otype}}
COMPLETE_OPTIONS_LIST+=	${OPTIONS_${otype}_${m}}
.  endfor
.endfor

## Now create the list of activated options
.if defined(OPTIONS_OVERRIDE)
# Special case $OPTIONS_OVERRIDE; if it is defined forget about anything done
# before
NEW_OPTIONS=
PORT_OPTIONS:=	${OPTIONS_OVERRIDE}
.else
NEW_OPTIONS=	${COMPLETE_OPTIONS_LIST}

## Set default options defined by the port maintainer
PORT_OPTIONS+=	${OPTIONS_DEFAULT}

## Set system-wide defined options (set by user in make.conf)
.  for opt in ${OPTIONS_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Remove the options excluded system-wide (set by user in make.conf)
.  for opt in ${OPTIONS_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor

## Set the options specified per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Unset the options excluded per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor

## Set the options specified per-port (set by user in make.conf)
.  for opt in ${${OPTIONS_NAME}_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Unset the options excluded per-port (set by user in make.conf)
.  for opt in ${${OPTIONS_NAME}_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor

# XXX to remove once UNIQUENAME is removed
## options files (from dialog)
.  if exists(${OPTIONSFILE}) && !make(rmconfig)
.  include "${OPTIONSFILE}"
.  endif
.  sinclude "${OPTIONSFILE}.local"
# XXX to remove once UNIQUENAME is removed

## options files (from dialog)
.  if exists(${OPTIONS_FILE}) && !make(rmconfig)
.  include "${OPTIONS_FILE}"
.  endif
.  sinclude "${OPTIONS_FILE}.local"

### convert WITH and WITHOUT found in make.conf or reloaded from old optionsfile
# XXX once WITH_DEBUG is not magic any more, do remove the :NDEBUG from here.
.for opt in ${ALL_OPTIONS:NDEBUG}
.if defined(WITH_${opt})
OPTIONS_WARNINGS+= "WITH_${opt}"
OPTIONS_WARNINGS_SET+=	${opt}
PORT_OPTIONS+=	${opt}
.endif
.if defined(WITHOUT_${opt})
OPTIONS_WARNINGS+= "WITHOUT_${opt}"
OPTIONS_WARNINGS_UNSET+=	${opt}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
.endif
.endfor

.if defined(OPTIONS_WARNINGS)
WARNING+=	"You are using the following deprecated options: ${OPTIONS_WARNINGS}"
WARNING+=	"If you added them on the command line, you should replace them by"
WARNING+=	"WITH=\"${OPTIONS_WARNINGS_SET}\" WITHOUT=\"${OPTIONS_WARNINGS_UNSET}\""
WARNING+=	""
WARNING+=	"If they are global options set in your make.conf, you should replace them with:"
.if defined(OPTIONS_WARNINGS_SET)
WARNING+=	"OPTIONS_SET=${OPTIONS_WARNINGS_SET}"
.endif
.if defined(OPTIONS_WARNINGS_UNSET)
WARNING+=	"OPTIONS_UNSET=${OPTIONS_WARNINGS_UNSET}"
.endif
WARNING+=	""
WARNING+=	"If they are local to this port, you should use:"
.if defined(OPTIONS_WARNINGS_SET)
WARNING+=	"${OPTIONS_NAME}_SET=${OPTIONS_WARNINGS_SET}"
.endif
.if defined(OPTIONS_WARNINGS_UNSET)
WARNING+=	"${OPTIONS_NAME}_UNSET=${OPTIONS_WARNINGS_UNSET}"
.endif
.endif

## Finish by using the options set by the port config dialog, if any
.  for opt in ${OPTIONS_FILE_SET}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

.for opt in ${OPTIONS_FILE_UNSET}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.endfor

.endif

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

# XXX To remove once UNIQUENAME will be removed
## Set the options specified per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_SET_FORCE}
.    if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.    endif
.  endfor

## Unset the options excluded per-port (set by user in make.conf)
.  for opt in ${${UNIQUENAME}_UNSET_FORCE}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endfor
# XXX To remove once UNIQUENAME will be removed

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
.for opt in ${WITH}
.  if !empty(COMPLETE_OPTIONS_LIST:M${opt})
PORT_OPTIONS+=	${opt}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.  endif
.endfor

.for opt in ${WITHOUT}
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
NEW_OPTIONS:=	${NEW_OPTIONS:N${opt}}
.endfor

# Finally, add options required by slave ports
PORT_OPTIONS+=	${OPTIONS_SLAVE}

# Sort options and eliminate duplicates
PORT_OPTIONS:=	${PORT_OPTIONS:O:u}

## Now some compatibility
.if empty(PORT_OPTIONS:MDOCS)
NOPORTDOCS=	yes
.endif

.if empty(PORT_OPTIONS:MEXAMPLES)
NOPORTEXAMPLES=	yes
.endif

.if ${PORT_OPTIONS:MDEBUG}
WITH_DEBUG=	yes
.endif

.if defined(NO_OPTIONS_SORT)
ALL_OPTIONS=	${OPTIONS_DEFINE}
.endif

.for opt in ${COMPLETE_OPTIONS_LIST} ${OPTIONS_SLAVE} ${OPTIONS_EXCLUDE_${ARCH}} ${OPTIONS_EXCLUDE}
# PLIST_SUB
PLIST_SUB?=
SUB_LIST?=
.  if defined(OPTIONS_SUB)
.    if ! ${PLIST_SUB:M${opt}=*}
.      if ${PORT_OPTIONS:M${opt}}
PLIST_SUB:=	${PLIST_SUB} ${opt}="" NO_${opt}="@comment "
.      else
PLIST_SUB:=	${PLIST_SUB} ${opt}="@comment " NO_${opt}=""
.      endif
.    endif
.    if ! ${SUB_LIST:M${opt}=*}
.      if ${PORT_OPTIONS:M${opt}}
SUB_LIST:=	${SUB_LIST} ${opt}="" NO_${opt}="@comment "
.      else
SUB_LIST:=	${SUB_LIST} ${opt}="@comment " NO_${opt}=""
.      endif
.    endif
.  endif

.  if ${PORT_OPTIONS:M${opt}}
.    if defined(${opt}_USE)
.      for option in ${${opt}_USE}
_u=		${option:C/=.*//g}
USE_${_u:tu}+=	${option:C/.*=//g:C/,/ /g}
.      endfor
.    endif
.    if defined(${opt}_CONFIGURE_ENABLE)
.      for iopt in ${${opt}_CONFIGURE_ENABLE}
CONFIGURE_ARGS+=	--enable-${iopt}
.      endfor
.    endif
.    if defined(${opt}_CONFIGURE_WITH)
.      for iopt in ${${opt}_CONFIGURE_WITH}
CONFIGURE_ARGS+=	--with-${iopt}
.      endfor
.    endif
.    for configure in CONFIGURE CMAKE QMAKE
.      if defined(${opt}_${configure}_ON)
${configure}_ARGS+=	${${opt}_${configure}_ON}
.      endif
.    endfor
.    for flags in ${_OPTIONS_FLAGS}
.      if defined(${opt}_${flags})
${flags}+=	${${opt}_${flags}}
.      endif
.    endfor
.    for deptype in ${_OPTIONS_DEPENDS}
.      if defined(${opt}_${deptype}_DEPENDS)
${deptype}_DEPENDS+=	${${opt}_${deptype}_DEPENDS}
.      endif
.    endfor
.  else
.    if defined(${opt}_CONFIGURE_ENABLE)
.      for iopt in ${${opt}_CONFIGURE_ENABLE}
CONFIGURE_ARGS+=	--disable-${iopt}
.      endfor
.    endif
.    if defined(${opt}_CONFIGURE_WITH)
.      for iopt in ${${opt}_CONFIGURE_WITH}
CONFIGURE_ARGS+=	--without-${iopt:C/=.*//}
.      endfor
.    endif
.    for configure in CONFIGURE CMAKE QMAKE
.      if defined(${opt}_${configure}_OFF)
${configure}_ARGS+=	${${opt}_${configure}_OFF}
.      endif
.    endfor
.    for flags in ${_OPTIONS_FLAGS}
.      if defined(${opt}_${flags}_OFF)
${flags}+=	${${opt}_${flags}_OFF}
.      endif
.    endfor
.    for deptype in ${_OPTIONS_DEPENDS}
.      if defined(${opt}_${deptype}_DEPENDS_OFF)
${deptype}_DEPENDS+=	${${opt}_${deptype}_DEPENDS_OFF}
.      endif
.    endfor
.  endif
.endfor
.endif

.if defined(_POSTMKINCLUDED) && !defined(POSTOPTIONSMKINCLUDED)
POSTOPTIONSMKINCLUDED=	options.mk

.if !target(pre-check-config)
pre-check-config:
.for single in ${OPTIONS_SINGLE}
.  for opt in ${OPTIONS_SINGLE_${single}}
.    if empty(ALL_OPTIONS:M${single}) || !empty(PORT_OPTIONS:M${single})
.      if !empty(PORT_OPTIONS:M${opt})
.        if defined(OPTFOUND)
OPTIONS_WRONG_SINGLE+=	${single}
.        else
OPTFOUND=	true
.        endif
.      endif
.    else
# if conditional and if the condition is unchecked, remove opt from the list of
# set options
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
OPTNOCHECK=	true
.    endif
.  endfor
.  if !defined(OPTFOUND) && !defined(OPTNOCHECK)
OPTIONS_WRONG_SINGLE+=	${single}
.  endif
.  undef OPTFOUND
.  undef OPTNOCHECK
.endfor
.undef single

.for radio in ${OPTIONS_RADIO}
.  for opt in ${OPTIONS_RADIO_${radio}}
.    if !empty(PORT_OPTIONS:M${opt})
.      if defined(OPTFOUND)
OPTIONS_WRONG_RADIO+=	${radio}
.      else
OPTFOUND=	true
.      endif
.    endif
.  endfor
.  undef OPTFOUND
.endfor

.for multi in ${OPTIONS_MULTI}
.  for opt in ${OPTIONS_MULTI_${multi}}
.    if empty(ALL_OPTIONS:M${multi}) || !empty(PORT_OPTIONS:M${multi})
.      if !empty(PORT_OPTIONS:M${opt})
OPTFOUND=	true
.      endif
.    else
# if conditional and if the condition is unchecked, remove opt from the list of
# set options
PORT_OPTIONS:=	${PORT_OPTIONS:N${opt}}
OPTNOCHECK=	true
.    endif
.  endfor
.  if !defined(OPTFOUND) && !defined(OPTNOCHECK)
OPTIONS_WRONG_MULTI+=	${multi}
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
	@FALSE
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
_CHECK_CONFIG_ERROR=	true
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

.if !target(pre-config)
pre-config:
D4P_ENV=	PKGNAME="${PKGNAME}" \
		PORT_OPTIONS="${PORT_OPTIONS}" \
		ALL_OPTIONS="${ALL_OPTIONS}" \
		OPTIONS_MULTI="${OPTIONS_MULTI}" \
		OPTIONS_SINGLE="${OPTIONS_SINGLE}" \
		OPTIONS_RADIO="${OPTIONS_RADIO}" \
		OPTIONS_GROUP="${OPTIONS_GROUP}" \
		NEW_OPTIONS="${NEW_OPTIONS}" \
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
D4P_ENV+=	${opt}_DESC=""${${opt}_DESC:Q}""
.endfor
.for otype in MULTI GROUP SINGLE RADIO
.  for m in ${OPTIONS_${otype}}
D4P_ENV+=	OPTIONS_${otype}_${m}="${OPTIONS_${otype}_${m}}" \
		${m}_DESC=""${${m}_DESC:Q}""
.    for opt in ${OPTIONS_${otype}_${m}}
D4P_ENV+=	${opt}_DESC=""${${opt}_DESC:Q}""
.    endfor
.  endfor
.endfor
.undef m
.undef otype
.undef opt
.endif # pre-config

.if !target(do-config)
do-config:
	echo "FOO"
.if empty(ALL_OPTIONS) && empty(OPTIONS_SINGLE) && empty(OPTIONS_MULTI) && empty(OPTIONS_RADIO) && empty(OPTIONS_GROUP)
	@${ECHO_MSG} "===> No options to configure"
.else
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@optionsdir=${OPTIONS_FILE}; optionsdir=$${optionsdir%/*}; \
	oldoptionsdir=${OPTIONSFILE}; oldoptionsdir=$${oldoptionsdir%/*}; \
	${ECHO_MSG} "===>  Switching to root credentials to create $${optionsdir}"; \
	(${SU_CMD} "${SH} -c \"if [ -d $${oldoptionsdir} -a ! -d $${optionsdir} ]; then ${MV} $${oldoptionsdir} $${optionsdir}; elif [ -d $${oldoptionsdir} -a -d $${optionsdir} ]; then ${RM} -rf $${oldoptionsdir} ; fi ; ${MKDIR} $${optionsd
ir} 2> /dev/null\"") || \
		(${ECHO_MSG} "===> Cannot create $${optionsdir}, check permissions"; exit 1); \
	${ECHO_MSG} "===>  Returning to user credentials"
.else
	@optionsdir=${OPTIONS_FILE}; optionsdir=$${optionsdir%/*}; \
	oldoptionsdir=${OPTIONSFILE}; oldoptionsdir=$${oldoptionsdir%/*}; \
	if [ -d $${oldoptionsdir} -a ! -d $${optionsdir} ]; then \
		${MV} $${oldoptionsdir} $${optionsdir}; \
	elif [ -d $${oldoptionsdir} -a -d $${optionsdir} ]; then \
		${RM} -rf $${oldoptionsdir} ; \
	fi ; \
	${MKDIR} $${optionsdir} 2> /dev/null || \
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
config-conditional:
.if !empty(NEW_OPTIONS)
	@cd ${.CURDIR} && ${MAKE} config;
.endif
.endif # config-conditional

.if !target(showconfig)
.include "${PORTSDIR}/Mk/components/options.desc.mk"
MULTI_EOL=	: you have to choose at least one of them
SINGLE_EOL=	: you have to select exactly one of them
RADIO_EOL=	: you can only select none or one of them
showconfig:
.if !empty(COMPLETE_OPTIONS_LIST)
	@${ECHO_MSG} "===> The following configuration options are available for ${PKGNAME}":
.for opt in ${ALL_OPTIONS}
	@[ -z "${PORT_OPTIONS:M${opt}}" ] || match="on" ; ${ECHO_MSG} -n "  ${opt}=$${match:-off}"
.  if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.  endif
	@${ECHO_MSG} ""
.endfor

#multi and conditional multis
.for otype in MULTI GROUP SINGLE RADIO
.  for m in ${OPTIONS_${otype}}
.    if empty(${m}_DESC)
	@${ECHO_MSG} "====> Options available for the ${otype:tl} ${m}${${otype}_EOL}"
.    else
	@${ECHO_MSG} "====> ${${m}_DESC}${${otype}_EOL}"
.    endif
.    for opt in ${OPTIONS_${otype}_${m}}
	@[ -z "${PORT_OPTIONS:M${opt}}" ] || match="on" ; ${ECHO_MSG} -n "     ${opt}=$${match:-off}"
.      if !empty(${opt}_DESC)
	@${ECHO_MSG} -n ": "${${opt}_DESC:Q}
.      endif
	@${ECHO_MSG} ""
.    endfor
.  endfor
.endfor

.undef otype
.undef m
.undef opt
	@${ECHO_MSG} "===> Use 'make config' to modify these settings"
.endif
.endif # showconfig

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
MULTI_START=    [
MULTI_END=      ]
GROUP_START=    [
GROUP_END=      ]
SINGLE_START=   (
SINGLE_END=     )
RADIO_START=    (
RADIO_END=      )
pretty-print-config:
.for opt in ${ALL_OPTIONS}
	@[ -z "${PORT_OPTIONS:M${opt}}" ] || match="+" ; ${ECHO_MSG} -n "$${match:--}${opt} "
.endfor
.for otype in MULTI GROUP SINGLE RADIO
.  for m in ${OPTIONS_${otype}}
	@${ECHO_MSG} -n "${m}${${otype}_START} "
.    for opt in ${OPTIONS_${otype}_${m}}
	@[ -z "${PORT_OPTIONS:M${opt}}" ] || match="+" ; ${ECHO_MSG} -n "$${match:--}${opt} "
.    endfor
	@${ECHO_MSG} -n "${${otype}_END} "
.  endfor
.endfor
.undef otype
.undef m
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
