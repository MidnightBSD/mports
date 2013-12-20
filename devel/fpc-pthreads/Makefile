# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-pthreads

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal wrapper for the pthreads library

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR+=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
