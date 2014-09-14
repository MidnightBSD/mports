# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	databases lang
PKGNAMESUFFIX=	-fpindexer

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Database indexer with database/flat file backend

USE_FPC=	chm fcl-base fcl-db

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
