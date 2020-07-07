PKGNAMESUFFIX=	-subversion

COMMENT=	Distributed source code management tool with BSD subversion bindings

MASTERDIR=	${.CURDIR}/../git

DESCR=		${.CURDIR}/pkg-descr

OPTIONS_SLAVE=	SVN

CONFLICTS_INSTALL=	git-[0-9]* git-gui-[0-9]* git-lite-[0-9]*

DISTINFO_FILE=	${MASTERDIR}/distinfo

.include "${MASTERDIR}/Makefile"

BUILD_DEPENDS+= ${LOCALBASE}/bin/sqlite3:databases/sqlite3
RUN_DEPENDS+=   ${LOCALBASE}/bin/sqlite3:databases/sqlite3
