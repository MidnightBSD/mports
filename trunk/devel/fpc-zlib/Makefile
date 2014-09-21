# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/devel/fpc-zlib/Makefile 341492 2014-01-28 00:16:57Z antoine $

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-zlib

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal interface to the zlib compression library

USE_FPC=	yes

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}

.include "${MASTERDIR}/Makefile"
