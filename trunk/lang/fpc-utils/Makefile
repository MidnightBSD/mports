# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	lang
PKGNAMESUFFIX=	-utils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal Compiler utils

LICENSE=	unknown

USE_FPC=	chm fcl-base fcl-net fcl-process fcl-res fppkg libcurl

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR+=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
