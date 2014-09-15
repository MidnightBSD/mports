# $MidnightBSD$

PORTREVISION=	0
CATEGORIES=	lang
PKGNAMESUFFIX=	-utils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal Compiler utils

LICENSE=	gpl2

USE_FPC=	chm fcl-base fcl-net fcl-passrc fcl-process fcl-res fppkg libcurl

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}
OPT=		-Fu../fcl/*

.include "${MASTERDIR}/Makefile"
