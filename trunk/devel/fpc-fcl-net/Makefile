# Created by: Alonso Cardenas Marquez <acm@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/devel/fpc-fcl-net/Makefile 341492 2014-01-28 00:16:57Z antoine $

PORTREVISION=	0
CATEGORIES=	devel lang
PKGNAMESUFFIX=	-fcl-net

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Free Pascal Component Library

USE_FPC=	fcl-async fcl-base fcl-xml fcl-passrc hash paszlib pthreads

MASTERDIR=	${.CURDIR}/../../lang/fpc
WRKUNITDIR=	${FPCSRCDIR}/packages/${PKGNAMESUFFIX:S/-//}
EXTRACTUNITDIR=	${WRKUNITDIR}
OPT=		-Fu${WRKDIR}/${WRKUNITDIR}/*

.include "${MASTERDIR}/Makefile"
