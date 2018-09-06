#-*- mode: makefile; tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD$ 
# $FreeBSD: ports/Mk/bsd.database.mk,v 1.14 2006/07/05 02:18:08 linimon Exp $
#

.if defined(_POSTMKINCLUDED) && !defined(Sqlite_Post_Include)

Sqlite_Post_Include=		sqlite.mk
Sqlite_Include_MAINTAINER=	ports@MidnightBSD.org

#
# USE_SQLITE	- Add dependency on sqlite library. Valid values are:
#				  3. If version is not specified directly then
#				  sqlite3 is used (if USE_SQLITE= yes).
# SQLITE_VER		- Detected sqlite version.

.if ${USE_SQLITE:tl} == "yes"
_SQLITE_VER=	3
.else
_SQLITE_VER=	 ${USE_SQLITE}
.endif


# USE_SQLITE is specified incorrectly, so mark this as IGNORE
.if ${_SQLITE_VER} == "3"
.	if ${OSVERSION} < 2000
LIB_DEPENDS+=	sqlite${_SQLITE_VER}:databases/sqlite${_SQLITE_VER}
SQLITE_VER=	${_SQLITE_VER}
.	endif
.else
IGNORE=	cannot install: unknown sqlite version: ${_SQLITE_VER}
.endif

.endif # defined(_POSTMKINCLUDED) && !defined(Sqlite_Post_Include)
