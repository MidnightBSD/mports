

PORTREVISION=	0
CATEGORIES=	databases gnome
PKGNAMESUFFIX=	5-mdb

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides mdb backend for the libgda5 library

MASTERDIR=	${.CURDIR}/../libgda5
BUILD_WRKSRC=	${WRKSRC}/providers/mdb/
INSTALL_WRKSRC=	${BUILD_WRKSRC}
PLIST=		${.CURDIR}/pkg-plist

LIBGDA5_SLAVE=	mdb

post-extract:
	@${REINPLACE_CMD} -e 's|MDB_SDATETIME|MDB_DATETIME|g' \
		${WRKSRC}/providers/mdb/gda-mdb-provider.c \
		${WRKSRC}/providers/mdb/libmdb-src/include/mdbtools.h \
		${WRKSRC}/providers/mdb/libmdb-src/data.c

.include "${MASTERDIR}/Makefile"
