# $MidnightBSD$ 

PORTREVISION=	0
CATEGORIES=	databases lang
PKGNAMESUFFIX=	-postgres

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal interface to PostGreSQL

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

OPTIONS_DEFINE=	PGSQL
PGSQL_DESC=	Install PostgreSQL client
OPTIONS_DEFAULT=	PGSQL

PGSQL_USE=	PGSQL=yes

.include "${MASTERDIR}/Makefile"
