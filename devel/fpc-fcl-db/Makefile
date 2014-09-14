# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-fcl-db

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal Component Library

USE_FPC=	dblib fcl-async fcl-base fcl-json fcl-xml hash mysql odbc oracle paszlib postgres \
		pthreads pxlib sqlite

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR+=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
