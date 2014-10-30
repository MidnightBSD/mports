# -*- mode: Makefile; tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD$ 
# $FreeBSD: ports/Mk/bsd.database.mk,v 1.14 2006/07/05 02:18:08 linimon Exp $
#

.if defined(_POSTMKINCLUDED) && !defined(Bdb_Post_Include)

Bdb_Post_Include=		bdb.mk
Bdb_Include_MAINTAINER=	ports@MidnightBSD.org

##
# USE_BDB		- Add Berkeley DB library dependency.
#				  If no version is given (by the maintainer via the port or
#				  by the user via defined variable), try to find the
#				  currently installed version.  Fall back to default if
#				  necessary (db41+).
# INVALID_BDB_VER
#				- This variable can be defined when the port doesn't
#				  support one or more versions of Berkeley DB.
# WANT_BDB_VER	- Maintainer can set a version of Berkeley DB to always
#				  build this port with (overrides WITH_BDB_VER).
# WITH_BDB_VER	- User defined global variable to set Berkeley DB version
# <UNIQUENAME>_WITH_BDB_VER
#				- User defined port specific variable to set
#				  Berkeley DB version
# WITH_BDB_HIGHEST
#				- Use the highest installed version of Berkeley DB
# BDB_LIB_NAME	- This variable is automatically set to the name of the
#				  Berkeley DB library (default: db41)
# BDB_LIB_CXX_NAME
#				- This variable is automatically set to the name of the
#				  Berkeley DB c++ library (default: db41_cxx)
# BDB_INCLUDE_DIR
#				- This variable is automatically set to the location of
#				  the Berkeley DB include directory.
#				  (default: ${LOCALBASE}/include/db41)
# BDB_LIB_DIR	- This variable is automatically set to the location of
#				  the Berkeley DB library directory.
# BDB_VER		- Detected Berkeley DB version.


_DB_PORTS=	48 5 48+ 5+
# Dependence lines for different db versions
db48_DEPENDS=	db-4.8.0:${PORTSDIR}/databases/db48
db5_DEPENDS=	db-5.3:${PORTSDIR}/databases/db5
# Detect db versions by finding some files
db48_FIND=	${LOCALBASE}/include/db48/db.h
db5_FIND=	${LOCALBASE}/include/db5/db.h

# For specifying [3, 40, 41, ..]+
_DB_48P=	48 ${_DB_5P}
_DB_5P=		5

# Override the global WITH_BDB_VER with the
# port specific <UNIQUENAME>_WITH_BDB_VER
.if defined(${UNIQUENAME:tu:S,-,_,}_WITH_BDB_VER)
WITH_BDB_VER=	${${UNIQUENAME:tu:S,-,_,}_WITH_BDB_VER}
.endif

.if defined(WITH_BDB_VER)
. if ${WITH_BDB_VER} == 4
USE_BDB=	48
. elif ${WITH_BDB_VER} != 1
USE_BDB=	${WITH_BDB_VER}
. endif
.endif
_WANT_BDB_VER=	${USE_BDB}

# Assume the default bdb version as 48
.if ${USE_BDB:tl} == "yes"
_WANT_BDB_VER=	48+
.endif

# Detect bdb version
_BDB_VER=	no
_BDB_IGNORE=	no

# Override the user defined WITH_BDB_VER with the WANT_BDB_VER
.if defined(WANT_BDB_VER)
.for bdb in ${_DB_PORTS}
.if ${WANT_BDB_VER} == "${bdb}" && ${_BDB_VER} == "no"
_BDB_VER=	${WANT_BDB_VER}
.endif
.endfor
USE_BDB=	${WANT_BDB_VER}
.else
.for bdb in ${_DB_PORTS}
.if ${_WANT_BDB_VER} == "${bdb}" && ${_BDB_VER} == "no"
_MATCHED_DB_VER:=	${bdb:S/+//}
. if ${_MATCHED_DB_VER} == "${bdb}"
# USE_BDB is exactly specified
_BDB_VER=	${bdb}
.else
# USE_BDB is specified as VER+
.  for dbx in ${_DB_${_MATCHED_DB_VER}P}
.   if exists(${db${dbx}_FIND}) && !defined(PACKAGE_BUILDING)
_BRKDB=	no
# Skip versions we are incompatible with
.    if defined(INVALID_BDB_VER)
_CHK_BDB:=	${dbx}
.     for BRKDB in ${INVALID_BDB_VER}
.      if ${_CHK_BDB} == "${BRKDB}"
_BRKDB= yes
.      endif
.     endfor
.    endif
.    if ${_BRKDB} == no
.     if defined(WITH_BDB_HIGHEST)
# Use the highest version of Berkeley DB found
_BDB_VER=	${dbx}
.     elif ${_BDB_VER} == no
# Use the first Berkeley DB found
_BDB_VER=	${dbx}
.     endif
.    endif
.   endif
.  endfor
.  if ${_BDB_VER} == "no"
# No existing db4 version is detected in system
_BDB_VER=	${_MATCHED_DB_VER}
.  endif
. endif
.endif
.endfor
.endif

# USE_BDB is specified incorrectly, so mark this as IGNORE
.if ${_BDB_VER} == "no"
IGNORE=	cannot install: unknown bdb version: ${USE_BDB}
.else
# Now check if we can use it
. if defined(INVALID_BDB_VER)
.  for VER in ${INVALID_BDB_VER}
_CHK_PLUS:=	${VER:S/+//}
# INVALID_BDB_VER is specified as VER+
.   if ${_CHK_PLUS}  != "${VER}"
.    if ${_BDB_VER} == "${_CHK_PLUS}"
_BDB_IGNORE=	yes
.    else
.     for VER_P in ${_DB_${_CHK_PLUS}P}
.      if ${_BDB_VER} == "${VER_P}"
_BDB_IGNORE=	yes
.      endif
.     endfor
.    endif
.   elif ${_BDB_VER} == "${VER}"
_BDB_IGNORE=	yes
.   endif
.  endfor
. endif
. if ${_BDB_IGNORE} == "yes"
IGNORE= cannot install: does not work with bdb version: ${_BDB_VER} (${INVALID_BDB_VER} not supported)
. else
# Now add the dependancy on Berkeley DB ${_BDB_VER) version
.if defined(BDB_BUILD_DEPENDS)
BUILD_DEPENDS+=	${db${_BDB_VER}_FIND}:${db${_BDB_VER}_DEPENDS:C/^db.*://}
.else
LIB_DEPENDS+=	${db${_BDB_VER}_DEPENDS}
.endif
.  if ${_BDB_VER} == 48
BDB_LIB_NAME=		db-4.8
BDB_LIB_CXX_NAME=	db_cxx-4.8
BDB_LIB_DIR=		${LOCALBASE}/lib/db48
.  elif ${_BDB_VER} == 5
BDB_LIB_NAME=		db-5.3
BDB_LIB_CXX_NAME=	db_cxx-5.3
BDB_LIB_DIR=		${LOCALBASE}/lib/db5
.  endif
BDB_LIB_NAME?=		db${_BDB_VER}
BDB_LIB_CXX_NAME?=	db${_BDB_VER}_cxx
BDB_INCLUDE_DIR?=	${LOCALBASE}/include/db${_BDB_VER}
BDB_LIB_DIR?=		${LOCALBASE}/lib
. endif
BDB_VER=	${_BDB_VER}
.endif

# Obsolete variables
.if defined(OBSOLETE_BDB_VAR)
. for var in ${OBSOLETE_BDB_VAR}
.  if defined(${var})
BAD_VAR+=	${var},
.  endif
. endfor
. if defined(BAD_VAR)
_IGNORE_MSG=	Obsolete variable(s) ${BAD_VAR} use WITH_BDB_VER or ${UNIQUENAME:tu:S,-,_,}_WITH_BDB_VER to select Berkeley DB version
.  if defined(IGNORE)
IGNORE+= ${_IGNORE_MSG}
.  else
IGNORE=	${_IGNORE_MSG}
.  endif
. endif
.endif


.endif #defined(_POSTMKINCLUDED) && !defined(Bdb_Post_Include)
