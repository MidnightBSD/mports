# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	graphics lang
PKGNAMESUFFIX=	-pasjpeg

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handling JPEG files with Pascal

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
