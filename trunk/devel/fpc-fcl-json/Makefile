# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-fcl-json

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JSON (JavaScript Object Notation) implementation in FreePascal

USE_FPC=	fcl-base

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
