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
.	if ${OSVERSION} < 2000
LIB_DEPENDS+=	sqlite${_SQLITE_VER}:databases/sqlite${_SQLITE_VER}
SQLITE_VER=	${_SQLITE_VER}
.	endif
.elif ${SQLITE_VER} == 2
LIB_DEPENDS+=	libsqlite.so:databases/sqlite${SQLITE_VER}
.else
.else
IGNORE=	cannot install: unknown sqlite version: ${_SQLITE_VER}
.endif

.endif
