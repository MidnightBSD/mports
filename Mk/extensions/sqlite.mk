# Provide support for SQLite
# Feature:	sqlite
# Usage:	USES=	sqlite[:version]

.if !defined(_INCLUDE_USES_SQLITE_MK)
_INCLUDE_USES_SQLITE_MK=	yes

.if !empty(sqlite_ARGS)
SQLITE_VER=	${sqlite_ARGS}
.endif
SQLITE_VER?=	3


# USE_SQLITE is specified incorrectly, so mark this as IGNORE
.if ${SQLITE_VER} == 3
BUILD_DEPENDS+=	${LOCALBASE}/bin/sqlite3:databases/sqlite3
LIB_DEPENDS+=	libsqlite3.so:databases/sqlite3
SQLITE_VER=	${SQLITE_VER}
.elif ${SQLITE_VER} == 2
LIB_DEPENDS+=	libsqlite.so:databases/sqlite${SQLITE_VER}
.else
IGNORE=	cannot install: unknown sqlite version: ${_SQLITE_VER}
.endif

.endif
