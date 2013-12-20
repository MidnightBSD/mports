# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	archivers devel
PKGNAMESUFFIX=	-paszlib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal unit for native compression IO

USE_FPC=	hash

NO_STAGE=	yes
MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR+=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
