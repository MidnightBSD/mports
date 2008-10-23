#-*- mode: makefile; tab-width: 4; -*-
# ex: ts=4
#
# $MidnightBSD: mports/Mk/bsd.database.mk,v 1.15 2008/10/20 17:48:49 laffer1 Exp $ 
# $FreeBSD: ports/Mk/bsd.database.mk,v 1.14 2006/07/05 02:18:08 linimon Exp $
#

.if defined(_POSTMKINCLUDED) && !defined(Sqlite_Post_Include)

Sqlite_Post_Include=		sqlite.mk
Sqlite_Include_MAINTAINER=	ports@MidnightBSD.org

#
# USE_SQLITE	- Add dependency on sqlite library. Valid values are:
#				  3 and 2. If version is not specified directly then
#				  sqlite3 is used (if USE_SQLITE= yes).
# SQLITE_VER		- Detected sqlite version.

.if ${USE_SQLITE:L} == "yes"
_SQLITE_VER=	3
.else
_SQLITE_VER=	 ${USE_SQLITE}
.endif

# USE_SQLITE is specified incorrectly, so mark this as IGNORE
.if ${_SQLITE_VER} == "3"
LIB_DEPENDS+=	sqlite${_SQLITE_VER}:${PORTSDIR}/databases/sqlite${_SQLITE_VER}
SQLITE_VER=	${_SQLITE_VER}
.elif ${_SQLITE_VER} == "2"
LIB_DEPENDS+=	sqlite.${_SQLITE_VER}:${PORTSDIR}/databases/sqlite${_SQLITE_VER}
SQLITE_VER=	${_SQLITE_VER}
.else
IGNORE=	cannot install: unknown sqlite version: ${_SQLITE_VER}
.endif

.endif # defined(_POSTMKINCLUDED) && !defined(Sqlite_Post_Include)
