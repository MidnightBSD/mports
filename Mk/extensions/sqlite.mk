# Provide support for SQLite
# Feature:	sqlite
# Usage:	USES=	sqlite[:args]
#
# Args is a comma-separated list of:
#   2         - use SQLite 2 (libsqlite.so)
#   3         - use SQLite 3 (default)
#   port      - force use of the databases/sqlite3 port even when SQLite3 is
#               present in the base system.  Use this when the port requires
#               features or compile-time options not available in the base
#               system SQLite3 (e.g. FTS5, JSON1, RTREE, session extension).
#
# Examples:
#   USES=	sqlite            # SQLite3, prefer base system
#   USES=	sqlite:port       # SQLite3, always use ports version
#   USES=	sqlite:3,port     # same as above, explicit version

.if !defined(_INCLUDE_USES_SQLITE_MK)
_INCLUDE_USES_SQLITE_MK=	yes

# Parse comma-separated args: extract version number and flags.
# The first token is either a version number (2, 3) or the keyword "port".
.if !empty(sqlite_ARGS)
_SQLITE_VER_ARG:=	${sqlite_ARGS:C/,.*//}
.  if ${sqlite_ARGS:M*port*}
SQLITE_FORCE_PORT=	yes
.  endif
.  if ${_SQLITE_VER_ARG} == port
# Only "port" was given — no explicit version; default to 3.
SQLITE_VER?=	3
.  else
SQLITE_VER?=	${_SQLITE_VER_ARG}
.  endif
.endif
SQLITE_VER?=	3

.if ${SQLITE_VER} == 3
# SQLite3 is part of the MidnightBSD base system.  By default, when the base
# system SQLite3 is present we use it directly so that mport does not require
# a ports package that will never be installed.
#
# Set SQLITE_FORCE_PORT=yes (or pass "port" in USES=sqlite args) to require
# the databases/sqlite3 port instead — necessary when the port needs features
# compiled into the ports build that are absent from the base system library
# (e.g. FTS5, JSON1, RTREE, the session extension, etc.).
.  if !defined(SQLITE_FORCE_PORT) && \
      exists(/usr/lib/libsqlite3.so) && exists(/usr/include/sqlite3.h)
SQLITE_PREFIX?=	/usr
.  else
BUILD_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3
LIB_DEPENDS+=	libsqlite3.so:databases/sqlite3
SQLITE_PREFIX?=	${LOCALBASE}
.  endif
.elif ${SQLITE_VER} == 2
LIB_DEPENDS+=	libsqlite.so:databases/sqlite${SQLITE_VER}
.else
IGNORE=	cannot install: unknown sqlite version: ${SQLITE_VER}
.endif

.endif
