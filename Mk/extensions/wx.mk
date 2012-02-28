#-*- mode: makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD: mports/Mk/extensions/wx.mk,v 1.3 2012/02/13 17:11:53 laffer1 Exp $
# $FreeBSD: ports/Mk/bsd.wx.mk,v 1.1 2006/07/05 02:13:12 linimon Exp $
#
# wx.mk - Support for WxWidgets based ports.
#
# Created by: Alejandro Pulver <alepulver@FreeBSD.org>
#
# Please view me with 4 column tabs!
#
# The following variables can be defined in a port that uses the WxWidgets
# library, contributed libraries, WxPython and/or more WxWidgets related
# components (with run and/or build dependencies). It can be used after and/or
# before bsd.port.pre.mk, but Python components will only work if Python
# variables (e.g. USE_PYTHON) are defined before it (this is a bsd.python.mk
# limitation).
# USE_WX		- Set to the list of WxWidgets versions that can be used by
#				  the port. The syntax allows the following elements:
#				  - Single version (e.g. "2.4").
#				  - Range of versions (e.g. "2.4-2.6"). Must be ascending.
#				  - Partial range: single version and upper (e.g. "2.4+").
#				  - Partial range: single version and lower (e.g. "-2.6").
#				  Multiple elements can be specified separated by spaces.
# USE_WX_NOT	- Set to the list of WxWidgets versions that can't be used by
#				  the port. In other words, it removes some versions from
#				  USE_WX. If the latter is not defined, it will have the value
#				  of all the possible versions. The syntax is like USE_WX.
# WX_COMPS		- Set to the list of WxWidgets components the port uses.
#				  Several components can be specified separated by spaces. By
#				  default it will have the value of "wx". Suffixes in the form
#				  "_xxx" may be added to the components to determine the
#				  dependency type.
#				  The available components are:
#				  wx			- The WxWidgets library.
#				  contrib		- The WxWidgets contributed libraries.
#				  python		- The WxWidgets API for Python (WxPython).
#				  mozilla		- WxMozilla (only for 2.4).
#				  svg			- WxSVG (only for 2.6).
#				  The available dependency types are:
#				  build			- Requires component for building.
#				  lib			- Requires component for building and running.
#				  run			- Requires component for running.
#				  If no suffix is present then "lib" will be used.
# WX_CONF_ARGS	- Set to "absolute" or "relative" if the port needs configure
#				  arguments in addition to the WX_CONFIG environment variable.
#				  It determines the type of parameters that have to be passed
#				  to the configure script. In the first case it adds
#				  "--with-wx-config=${WX_CONFIG}" (absolute path of WX_CONFIG),
#				  and in second one "--with-wx=${LOCALBASE}" and
#				  "--with-wx-config=${WX_CONFIG:T} (prefix and name).
# WX_UNICODE	- Set to "yes" (or anything) if the port needs the Unicode
#				  version of the WxWidgets library and/or contributed
#				  libraries.
#				  NOTE: this should NOT be used for ports that can be compiled
#				  with Unicode or not, but for the ones that require it. The
#				  first case is handled by the user variable WITH_UNICODE.
# WANT_WX		- Set to "yes" or a valid single version (no ranges, etc).
#				  In both cases it will detect the installed WxWidgets
#				  components and add them to the variable HAVE_WX. If a
#				  version is selected, HAVE_WX will contain a list of
#				  components in the other case it will contain a list of
#				  "component-version" pairs (e.g. wx-2.6, contrib-2.4, etc).
#				  It has to be used before bsd.port.pre.mk.
# WANT_WX_VER	- Set to the prefered WxWidgets version for the port. It must
#				  be present in USE_WX or missing in USE_WX_NOT. This is
#				  overriden by the user variable WITH_WX_VER if set. It can
#				  contain multiple versions in order of preference (last ones
#				  are tried first).
#
# The following variables are intended for the user and can be defined in
# make.conf.
# WITH_UNICODE	- If the variable is defined and both the running FreeBSD
#				  version and the selected WxWidgets version support Unicode,
#				  then the Unicode version of WxWidgets is used.
# WITH_WX_VER	- If the variable is defined the version it contains will be
#				  used as the default for ports that support multiple
#				  WxWidgets versions. It can contain multiple versions, and
#				  the last possible one will be used.
#
# The following variables are defined by this file, to be read from the port.
# WX_UNICODE	- If this variable is not defined by the port (which means it
#				  requires the Unicode version of WxWidgets), it will be
#				  defined in the case the Unicode version is used (enabled by
#				  the user through WITH_UNICODE).
# WX_VERSION	- The WxWidgets version that is going to be used.
# HAVE_WX		- The list of WxWidgets components installed, if WANT_WX was
#				  defined. The components will have version suffix if it was
#				  set to "yes").
#
# Examples:
# - A port that needs WxWidgets 2.6 and contributed libraries with Unicode.
#	USE_WX=		2.6
#	WX_COMPS=	wx contrib
#	WX_UNICODE=	yes
# - A port that needs WxPython 2.4 for running.
#	USE_PYTHON=	yes
#	USE_WX=		2.4
#	WX_COMPS=	python_run
# - A port that needs WxPython 2.4 or 2.6 for building.
#	USE_PYTHON=	yes
#	USE_WX=		2.4 2.6
#	WX_COMPS=	python_build
# - A port that needs WxWidgets version 2.4 or higher and contributed
#	libraries.
#	USE_WX=		2.4+
#	WX_COMPS=	wx contrib
# - A port that needs WxWidgets of any version other than 2.4.
#	USE_WX_NOT=	2.4
#
# Notes:
# - The version is processed on each inclusion, so USE_WX, USE_WX_NOT and
#	WX_UNICODE can be modified before and after including bsd.port.pre.mk.
#	After determining the version and Unicode, WX_CONFIG will be defined.
#


.if !defined(_POSTMKINCLUDED) && !defined(Wx_Pre_Include)

Wx_Pre_Include=			wx.mk
WX_Include_MAINTAINER=	ports@MidnightBSD.org

#
# Global definitions.
#

.if !defined(_WX_Definitions_Done)
_WX_Definitions_Done=	yes

#
# Common variables:
# _WX_COMPS_ALL			- List of valid components.
# _WX_DEP_TYPES_ALL		- List of valid dependency types.
# _WX_VERS_ALL			- List of supported versions.
# _WX_VERS_UC_ALL		- List of Unicode capable versions.
# _WX_CHANGE_VARS		- List of variables allowed to change between pre and
#						  post inclusions (related to version).
# _WX_LISTS_ORDER		- Reverse lists preference order.
# _WX_AUTO_VARS			- Variables defined sometimes that may have to be
#						  redefined later.
#

_WX_COMPS_ALL=			wx contrib python mozilla svg
_WX_DEP_TYPES_ALL=		build lib run
_WX_VERS_ALL=			2.4 2.6
_WX_VERS_UC_ALL=		2.6
_WX_CHANGE_VARS=		USE_WX USE_WX_NOT WX_UNICODE
_WX_LISTS_ORDER=		_WX_VER_FINAL WANT_WX_VER WITH_WX_VER
_WX_AUTO_VARS=			USE_WX WX_CONFIG

#
# Variables used to determine what is needed:
# _WX_PORT_comp_ver		- Port directory.
# _WX_LIB_comp_ver		- Name of the shared library (optional).
# _WX_SHVER_comp_ver	- Shared library version (optional).
# _WX_FILE_comp_ver		- File installed by that component.
#

_WX_PORT_wx_2.4=		wxgtk24
_WX_LIB_wx_2.4=			wx_gtk2-2.4

_WX_PORT_contrib_2.4=	wxgtk24-contrib
_WX_LIB_contrib_2.4=	wx_gtk2_canvas-2.4

_WX_PORT_python_2.4=	py-wxPython24
_WX_FILE_python_2.4=	${PYTHON_SITELIBDIR}/wx/__init__.py

_WX_PORT_mozilla_2.4=	wxmozilla
_WX_LIB_mozilla_2.4=	wxmozilla_gtk2-2.4

# wxgtk 2.6
_WX_PORT_wx_2.6=	wxgtk26${_WX_UCL}
_WX_LIB_wx_2.6=		wx_base${_WX_UC}-2.6

_WX_PORT_contrib_2.6=	wxgtk26${_WX_UCL}-contrib
_WX_LIB_contrib_2.6=	wx_gtk2${_WX_UC}_animate-2.6

_WX_PORT_python_2.6=	py-wxPython26${_WX_UCL}
_WX_FILE_python_2.6=	${PYTHON_SITELIBDIR}/wx-2.6-gtk2${_WX_PYSUFX}/wx/__init__.py

_WX_PORT_svg_2.6=	wxsvg
_WX_LIB_svg_2.6=	wxsvg

# wxgtk 2.8
_WX_PORT_wx_2.8=	wxgtk28${_WX_UCL}
_WX_LIB_wx_2.8=		wx_base${_WX_UC}-2.8

_WX_PORT_contrib_2.8=	wxgtk28${_WX_UCL}-contrib
_WX_LIB_contrib_2.8=	wx_gtk2${_WX_UC}_fl-2.8

_WX_PORT_python_2.8=	py-wxPython28${_WX_UCL}
_WX_FILE_python_2.8=	${PYTHON_SITELIBDIR}/wx-2.8-gtk2${_WX_PYSUFX}/wx/__init__.py

_WX_PORT_svg_2.8=	wxsvg
_WX_LIB_svg_2.8=	wxsvg


# Set _WX_SHVER_comp_ver to 0 and _WX_FILE_comp_ver for libs appropiately.

.for comp in ${_WX_COMPS_ALL}
.	for ver in ${_WX_VERS_ALL}
.		if defined(_WX_LIB_${comp}_${ver})
_WX_SHVER_${comp}_${ver}=	0
_WX_FILE_${comp}_${ver}=	${LOCALBASE}/lib/lib${_WX_LIB_${comp}_${ver}}.so.${_WX_SHVER_${comp}_${ver}}
.		endif
.	endfor
.endfor

.endif		# !_WX_Defined_Done

#
# Check for present components.
#


.if defined(WANT_WX)

# Check if Unicode will be used.

.	for __WANT_WX in ${WANT_WX}
.		if defined(WITH_UNICODE) && \
		   (${_WX_VERS_UC_ALL:M${__WANT_WX}} != "" || ${WANT_WX:L} == "yes")
_WX_WANT_UNICODE=		yes
.		endif
.	endfor

# These variables are reprocessed later so they won't affect other parts.

.	if defined(WX_UNICODE) || defined(_WX_WANT_UNICODE)
_WX_VER_FINAL=			${_WX_VERS_UC_ALL}
_WX_UC=					u
_WX_UCL=				-unicode
_WX_PYSUFX=				-unicode
.	else
_WX_VER_FINAL=			${_WX_VERS_ALL}
_WX_UC=					#
_WX_UCL=				#
_WX_PYSUFX=				-ansi
.	endif

# Fill HAVE_WX with the installed components.

.	for __WANT_WX in ${WANT_WX}
# Check if WANT_WX contains more than one word.
.		if defined(HAVE_WX)
IGNORE?=				selected multiple values for WANT_WX: ${WANT_WX}
.		endif
HAVE_WX=				#
# Check for all versions.
.		if ${WANT_WX:L} == "yes"
.			for comp in ${_WX_COMPS_ALL}
.				for ver in ${_WX_VER_FINAL}
_WX_COMP=				_WX_FILE_${comp}_${ver}
.					if defined(${_WX_COMP}) && exists(${${_WX_COMP}})
HAVE_WX+=				${comp}-${ver}
.					endif
.				endfor
.			endfor
# Check for a specific version.
.		elif ${_WX_VERS_ALL:M${__WANT_WX}}
.			for comp in ${_WX_COMPS_ALL}
.				if exists(${_WX_FILE_${comp}_${__WANT_WX}})
HAVE_WX+=				${comp}
.				endif
.			endfor
.		else
IGNORE?=				selected an invalid value for WANT_WX: ${__WANT_WX}
.		endif
.	endfor
.endif		# !WANT_WX

#
# Check if the version has changed between inclusions.
#

.if defined(_WX_Version_Done)
.	undef _WX_HAS_CHANGED

.	for var in ${_WX_CHANGE_VARS}
.		if (defined(${var}) && !defined(_WX_OLD_${var})) || \
		   (!defined(${var}) && defined(_WX_OLD_${var})) || \
		   (defined(_WX_OLD_${var}) && ${_WX_OLD_${var}} != ${${var}})
_WX_HAS_CHANGED=		yes
.		endif
.	endfor
.endif		# _WX_Version_Done

#
# Select WxWidgets version.
#

.if (!defined(_WX_Version_Done) || defined(_WX_HAS_CHANGED)) && \
	(defined(USE_WX) || defined(USE_WX_NOT))
_WX_Version_Done=		yes

# Handle automatic variables.

.for var in ${_WX_AUTO_VARS}
.	if defined(_WX_${var}_DEFINED)
.		undef ${var}
.	endif
.	if !defined(${var})
_WX_${var}_DEFINED=		yes
.	endif
.endfor

# Reset old variable values.

.if defined(_WX_HAS_CHANGED)
.	undef _WX_VER
.	undef _WX_IGNORE
.endif

# Set defaults (if one isn't present).

USE_WX?=				${_WX_VERS_ALL}
USE_WX_NOT?=			#

#
# Make lists of valid and invalid versions.
#
# The following variables are used:
# _WX_VER_CHECK			- If the version is a single one, express in a range.
# _WX_VER_MIN			- Lower version of the range.
# _WX_VER_MAX			- Higher version of the range.
# _WX_VER_LIST			- List of requested versions.
# _WX_VER_NOT_LIST		- List of disallowed versions.
# _WX_VER_MERGED		- List of requested version without disallowed ones.
#

.for list in VER VER_NOT
_WX_${list}_LIST=		#
.	for ver in ${USE_WX${list:C/VER//}}
_WX_VER_CHECK:=			${ver:C/^([[:digit:]]+(\.[[:digit:]]+)*)$/\1-\1/}
_WX_VER_MIN:=			${_WX_VER_CHECK:C/([[:digit:]]+(\.[[:digit:]]+)*)[-+].*/\1/}
_WX_VER_MAX:=			${_WX_VER_CHECK:C/.*-([[:digit:]]+(\.[[:digit:]]+)*)/\1/}
# Minimum version not specified.
.		if ${_WX_VER_MIN} == ${_WX_VER_CHECK}
.			undef _WX_VER_MIN
.			for v in ${_WX_VERS_ALL}
_WX_VER_MIN?=			${v}
.			endfor
.		endif
# Maximum version not specified.
.		if ${_WX_VER_MAX} == ${_WX_VER_CHECK}
.			for v in ${_WX_VERS_ALL}
_WX_VER_MAX=			${v}
.			endfor
.		endif
# Expand versions and add valid ones to each list.
.		for v in ${_WX_VERS_ALL}
.			if ${_WX_VER_MIN} <= ${v} && ${_WX_VER_MAX} >= ${v} && \
			   ${_WX_${list}_LIST:M${v}} == ""
_WX_${list}_LIST+=		${v}
.			endif
.		endfor
.	endfor
.endfor

# Merge the lists into a single list of valid versions.

_WX_VER_MERGED=			#
.for ver in ${_WX_VER_LIST}
.	if ${_WX_VER_NOT_LIST:M${ver}} == ""
_WX_VER_MERGED+=		${ver}
.	endif
.endfor

# Check for a null version.

.if empty(_WX_VER_MERGED)
_WX_IGNORE?=			selected a null or invalid WxWidgets version
.endif

#
# Unicode support.
#

# Create a list of capable versions.

_WX_VER_UC=				#
.for ver in ${_WX_VER_MERGED}
.	if ${_WX_VERS_UC_ALL:M${ver}} != ""
_WX_VER_UC+=			${ver}
.	endif
.endfor

# Requested by the user (optional).

.if defined(WITH_UNICODE)
.	for ver in ${_WX_VER_UC}
.		if ${_WX_VERS_UC_ALL:M${ver}} != ""
WX_UNICODE=				yes
.		endif
.	endfor
.endif

# Requested by the port (mandatory).

.if defined(WX_UNICODE)
.	if empty(_WX_VER_UC)
_WX_IGNORE?=			selected a WxWidgets version which does not support Unicode: ${_WX_VER_MERGED}
.	endif
.endif

# Set Unicode variables.

.if defined(WX_UNICODE)
_WX_VER_FINAL=			${_WX_VER_UC}
_WX_UC=					u
_WX_UCL=				-unicode
_WX_PYSUFX=				-unicode
.else
_WX_VER_FINAL=			${_WX_VER_MERGED}
_WX_UC=					#
_WX_UCL=				#
_WX_PYSUFX=				-ansi
.endif

#
# Choose final version.
#

#
# Check for the following (in order):
# 1) WITH_WX_VER		- User preference.
# 2) WANT_WX_VER		- Port preference.
# 3) _WX_VER_FINAL		- Available versions.
#

.for list in ${_WX_LISTS_ORDER}
.	if defined(${list})
.		for ver in ${${list}}
.			if ${_WX_VER_FINAL:M${ver}} != ""
_WX_VER=				${ver}
.			endif
.		endfor
.	endif
.endfor

#
# Set variables.
#

WX_VERSION=				${_WX_VER}
WX_CONFIG?=				${LOCALBASE}/bin/wxgtk2${_WX_UC}-${_WX_VER}-config

# Define old values for detecting changes.

.for var in ${_WX_CHANGE_VARS}
.	if defined(${var})
_WX_OLD_${var}:=		${${var}}
.	endif
.endfor

.endif		# ! _WX_Version_Done || _WX_HAS_CHANGED

#
# Process components list and add dependencies, variables, etc.
#

.endif # !defined(_POSTMKINCLUDED) && !defined(Wx_Pre_Include)

.if defined(_POSTMKINCLUDED) && !defined(Wx_Post_Include)

Wx_Post_Include=	wx.mk

# Error check.
.if defined(_WX_IGNORE)
IGNORE?=				${_WX_IGNORE}
.endif

#
# Component parsing.
#
# The variables used are:
# _WX_COMP				- Component part.
# _WX_DEP_TYPE			- Dependency type part.
# _WX_COMP_NEW			- Component + dependency type.
# _WX_COMPS_FINAL		- Final list of components with dependency types.
#

# Default components.

WX_COMPS?=				wx

# Detect invalid and duplicated components.

_WX_COMPS_FINAL=		#
.for comp in ${WX_COMPS}
_WX_COMP=				${comp:C/_([[:alpha:]]+)$//}
_WX_DEP_TYPE=			${comp:C/.+_([[:alpha:]]+)$/\1/}
.	if ${_WX_COMP} == ${comp}
_WX_DEP_TYPE=			lib
.	endif
_WX_COMP_NEW=			${_WX_COMP}_${_WX_DEP_TYPE}
.	for __WX_COMP in ${_WX_COMP}
.		if ${_WX_COMPS_ALL:M${__WX_COMP}} == ""
IGNORE?=				selected an invalid WxWidgets component: ${__WX_COMP}
.		endif
.	endfor
.	for __WX_DEP_TYPE in ${_WX_DEP_TYPE}
.		if ${_WX_DEP_TYPES_ALL:M${__WX_DEP_TYPE}} == ""
IGNORE?=				selected an invalid WxWidgets dependency type: ${__WX_DEP_TYPE}
.		endif
.	endfor
.	if !defined(_WX_PORT_${_WX_COMP}_${_WX_VER})
IGNORE?=				selected a WxWidgets component (${_WX_COMP}) which is not available for the selected version (${_WX_VER})
.	endif
.	for newcomp in ${_WX_COMP_NEW}
.		if ${_WX_COMPS_FINAL:M${newcomp}} == ""
_WX_COMPS_FINAL+=		${newcomp}
.		endif
.	endfor
.endfor

# Add dependencies.
#
# The variable used are:
# _WX_COMP		-		- Component part.
# _WX_DEP_TYPE			- Dependency type part.

.for comp in ${_WX_COMPS_FINAL}
_WX_COMP=				${comp:C/_([[:alpha:]]+)$//}
_WX_DEP_TYPE=			${comp:C/.+_([[:alpha:]]+)$/\1/}
.	if ${_WX_DEP_TYPE} == "lib"
.		if defined(_WX_LIB_${_WX_COMP}_${_WX_VER})
LIB_DEPENDS+=			${_WX_LIB_${_WX_COMP}_${_WX_VER}}:${PORTSDIR}/x11-toolkits/${_WX_PORT_${_WX_COMP}_${_WX_VER}}
.		else
BUILD_DEPENDS+=			${_WX_FILE_${_WX_COMP}_${_WX_VER}}:${PORTSDIR}/x11-toolkits/${_WX_PORT_${_WX_COMP}_${_WX_VER}}
RUN_DEPENDS+=			${_WX_FILE_${_WX_COMP}_${_WX_VER}}:${PORTSDIR}/x11-toolkits/${_WX_PORT_${_WX_COMP}_${_WX_VER}}
.		endif
.	else
${_WX_DEP_TYPE:U}_DEPENDS+=	${_WX_FILE_${_WX_COMP}_${_WX_VER}}:${PORTSDIR}/x11-toolkits/${_WX_PORT_${_WX_COMP}_${_WX_VER}}
.	endif
.endfor

#
# Set build related variables.
#

MAKE_ENV+=				WX_CONFIG=${WX_CONFIG}
CONFIGURE_ENV+=			WX_CONFIG=${WX_CONFIG}

.if defined(WX_CONF_ARGS)
.	if ${WX_CONF_ARGS:L} == "absolute"
CONFIGURE_ARGS+=		--with-wx-config=${WX_CONFIG}
.	elif ${WX_CONF_ARGS:L} == "relative"
CONFIGURE_ARGS+=		--with-wx=${LOCALBASE} \
						--with-wx-config=${WX_CONFIG:T}
.	else
IGNORE?=				selected an invalid WxWidgets configure argument type: ${WX_CONF_ARGS}
.	endif
.endif

.endif		# !Post_Include
